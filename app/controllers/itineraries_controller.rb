class ItinerariesController < ApplicationController
  def new
  end

  def create
    @itinerary = Itinerary.create(user: current_user)
    # # EVENTS API REQUEST
    # submit_events_api_call(params[:date], params[:begin_time], params[:end_time], params[:location], @itinerary)
    # p @itinerary.activities

    # #BUSINESS SEARCH API REQUEST
    # submit_business_api_call(params[:date], params[:begin_time], params[:budget], params[:location], @itinerary)
    # p @itinerary.activities

    # WORKING ON METHOD TO TOGGLE BETWEEN API CALLS
    # sample_business_or_events_search

  end

  def show
    @activities = []
    y = YelpResponse.new
    response = y.get_events_response({location: "chicago", categories: "sports-active-life", start_date: 1512324000, end_date: 1512367199})
    # response = y.get_events_response({location: location, categories: categories, start_date: start_date})
    handle_events_response(response, y)
    y.destroy

    y = YelpResponse.new
    response = y.get_businesses_response({term: "fancy", categories: "restaurants", location: "chicago", price: "3", open_at: 1512345600, limit: 1})
    response = y.get_businesses_response()
    handle_businesses_response(response, y)
  end

  def destroy
  end

  def updated
  end

  private
  def set_event_attributes(y, itinerary)
      Activity.create!(
      name: y.name,
      time_start: y.time_start,
      event_site_url: y.event_site_url,
      tickets_url: y.tickets_url,
      cost: y.cost,
      cost_max: y.cost_max,
      image_url: y.image_url,
      display_address: y.display_address,
      latitude: y.latitude,
      longitude: y.longitude,
      itinerary_id: itinerary.id,
      version: "event"
    )
  end

  def handle_events_response(response, y, itinerary)
    if response["error"]
      @error = "Sorry we're having a hard time finding an event for you. Please try again."
    else
      y.assign_event_values(response)
      set_event_attributes(y, itinerary)
    end
  end

  def set_business_attributes(y, itinerary)
      Activity.create!(
      name: y.name,
      rating: y.rating,
      price: y.price,
      display_phone: y.display_phone,
      title: y.title,
      url: y.url,
      latitude: y.latitude,
      longitude: y.longitude,
      image_url: y.image_url,
      display_address: y.display_address,
      itinerary_id: itinerary.id,
      version: "dining"
    )
  end

  def handle_businesses_response(response, y, itinerary)
    if response["error"]
      @error = "Sorry we're having a hard time finding a business for you. Please try again."
    else
      y.assign_business_values(response)
      set_business_attributes(y, itinerary)
    end
  end

  def submit_events_api_call(date, begin_time, end_time, location, itinerary)
    preferences_request = current_user.supplemental_preferences
    designated_preference = preferences_request.sample
    category_request = designated_preference.events_categories.sample
    start_date_time = user_input_to_unix(date, begin_time)
    end_date_time = user_input_to_unix(date, end_time)
    y = YelpResponse.new
    response = y.get_events_response({location: location, categories: category_request, start_date: start_date_time, end_date: end_date_time})
    handle_events_response(response, y, itinerary)
    y.destroy
  end

  def submit_business_api_call(date, begin_time, budget, location, itinerary)
      preferences_request_biz = current_user.supplemental_preferences
      designated_preference_biz = preferences_request_biz.sample
      category_request_biz = designated_preference_biz.business_categories.sample
      business_search_term = designated_preference_biz.keywords.sample
      open_date_time = user_input_to_unix(date, begin_time)
      user_budget = convert_to_yelp_budget(budget)
      y = YelpResponse.new
      response = y.get_businesses_response({term: business_search_term, categories: category_request_biz, location: location, price: "1,2,3", open_at: 1512345600, limit: 1})
      handle_businesses_response(response, y, itinerary)
      y.destroy
  end

  def sample_business_or_events_search
    sample_type = []
    sample_type << submit_events_api_call(params[:date], params[:begin_time], params[:end_time], params[:location], @itinerary)
    sample_type << submit_business_api_call(params[:date], params[:begin_time], params[:location], @itinerary)
    sample_type.sample
  end

end
