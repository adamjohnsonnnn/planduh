class ItinerariesController < ApplicationController
  def new
  end

  def create
    @itinerary = Itinerary.create(user: current_user)
    preferences_api = current_user.submitted_preferences
    p designated_preference = preferences_api.sample
    p "************"
    p designated_preference.events_categories.sample
    # category_api = preferences_api[0].categories
    # start_date_time = user_input_to_unix(params[:date], params[:begin_time])
    # end_date_time = user_input_to_unix(params[:date], params[:end_time])
    # y = YelpResponse.new
    # response = y.get_events_response({location: params[:location], categories: category_api, start_date: start_date_time , end_date: end_date_time})
    # handle_events_response(response, y, @itinerary)
    # y.destroy
    p Preference.all
    # preferences_api_biz = current_user.submitted_preferences
    # category_api_biz = preferences_api[0].categories
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
      # @activities << set_event_attributes(y, itinerary)
      set_event_attributes(y, itinerary)
      p "*****************"
      p y
      p "*****************"
      p itinerary
    end
  end

  def set_business_attributes(y)
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
      itinerary_id: 1,
      version: "dining"
    )
  end

  def handle_businesses_response(response, y)
    if response["error"]
      @error = "Sorry we're having a hard time finding a business for you. Please try again."
    else
      y.assign_business_values(response)
      @activities << set_business_attributes(y)
    end
  end

end
