class ItinerariesController < ApplicationController
  def new
  end

  def create
    @itinerary = Itinerary.create(user: current_user)
    # create time window
    window = time_window(params[:begin_time], params[:end_time])
    # get latitude and longitude of location
    lat_long = create_lat_long_coordinates(params[:location])

    i = 0
    while i < window
      submit_events_api_call(params[:date], params[:begin_time], params[:end_time], params[:location], @itinerary)
      p @itinerary.activities.length
      if @itinerary.activities.length <= i
        response = submit_business_api_call(params[:date], params[:begin_time], params[:budget], params[:location], @itinerary)
      end
      if @itinerary.activities.length <= i
        submit_google_places_api_call(lat_long, @itinerary)
      end
      i += 1
    end

    redirect_to "/itineraries/#{@itinerary.id}"
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @activities = @itinerary.activities
    p @activities
    # y = YelpResponse.new
    # response = y.get_events_response({location: "chicago", categories: "sports-active-life", start_date: 1512324000, end_date: 1512367199})
    # handle_events_response(response, y)
    # y.destroy

    # y = YelpResponse.new
    # response = y.get_businesses_response({term: "fancy", categories: "restaurants", location: "chicago", price: "3", open_at: 1512345600, limit: 1})
    # response = y.get_businesses_response()
    # handle_businesses_response(response, y)


    @markers_hash = Gmaps4rails.build_markers(@activities) do |activity, marker|
      marker.lat activity.latitude
      marker.lng activity.longitude
    end
  end

  def destroy
  end

  def updated
  end

  private

  # YELP EVENT API METHODS
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

  def handle_events_response(response, y, itinerary)
    if response["error"]
      @error = "Sorry we're having a hard time finding an event for you. Please try again."
    else
      y.assign_event_values(response)
      set_event_attributes(y, itinerary)
    end
  end

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

  # YELP BUSINESS API METHODS
  def submit_business_api_call(date, begin_time, budget, location, itinerary)
        preferences_request_biz = current_user.supplemental_preferences
        designated_preference_biz = preferences_request_biz.sample
        category_request_biz = designated_preference_biz.business_categories.sample
        business_search_term = designated_preference_biz.keywords.sample
        open_date_time = user_input_to_unix(date, begin_time)
        user_budget = convert_to_yelp_budget(budget)
        y = YelpResponse.new
        response = y.get_businesses_response({term: business_search_term, categories: category_request_biz, location: location, price: user_budget, open_at: open_date_time, limit: 20})
        response_container = []
        response_container << response["businesses"].sample
        response_convert_hash = {}
        response_convert_hash["businesses"] = response_container
        handle_businesses_response(response_convert_hash, y, itinerary)
  end

  def handle_businesses_response(response, y, itinerary)
    if response["businesses"][0] != nil
      if response["error"]
        @error = "Sorry we're having a hard time finding a business for you. Please try again."
      else
        y.assign_business_values(response)
        set_business_attributes(y, itinerary)
      end
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

  # GOOGLE PLACES API METHODS
  def create_lat_long_coordinates(location)
    gmaps = GoogleMapsService::Client.new
    lat_long = gmaps.geocode(location)
    latitude = lat_long[0][:geometry][:location][:lat]
    longitude = lat_long[0][:geometry][:location][:lng]
    lat_long = [latitude, longitude]
  end

  def submit_google_places_api_call(lat_long, itinerary)
    # identify preferences
    preferences_request_biz = current_user.supplemental_preferences
    designated_preference_biz = preferences_request_biz.sample
    business_search_term = designated_preference_biz.keywords.sample

    google_places_request_types = designated_preference_biz.google_places_types.sample
    query = business_search_term

    # submit GOOGLE PLACES API request
    @client = GooglePlaces::Client.new("AIzaSyDcXqSmNy66_F5aF7EbVUNtWjBOuXtwxyU")
    initial_response = @client.spots(lat_long[0], lat_long[1], :types => google_places_request_types, :keywords => query, :radius => 2000)
    sorted_response = initial_response.sort_by { |response| response.rating || 0 }
    reverse_sorted_response = sorted_response.reverse
    top_five_responses = reverse_sorted_response.slice(0,5)
    if top_five_responses.sample
      full_response = @client.spot(top_five_responses.sample.place_id)
      set_google_places_attributes(full_response, itinerary)
    end
  end

  def set_google_places_attributes(response, itinerary)
      photos = response.photos
      if photos.length > 0
        photo = photos[0].fetch_url(800)
        else
        photo = nil
      end
      Activity.create!(
      name: response.name,
      rating: response.rating,
      price: response.price_level,
      display_phone: response.formatted_phone_number,
      url: response.website,
      latitude: response.lat,
      longitude: response.lng,
      image_url: photo,
      display_address: response.formatted_address,
      business_hours: response.opening_hours,
      itinerary_id: itinerary.id,
      version: "google_places"
    )
  end

  def sample_business_or_events_search
    sample_type = []
    sample_type << submit_events_api_call(params[:date], params[:begin_time], params[:end_time], params[:location], @itinerary)
    sample_type << submit_business_api_call(params[:date], params[:begin_time], params[:location], @itinerary)
    sample_type.sample
  end

end
