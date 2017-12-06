class ItinerariesController < ApplicationController
  def new
    if logged_in?
      if current_user.preferences.length > 0
        render 'new'
      else
        redirect_to surveys_path
      end
    else
      redirect_to new_user_path
    end
  end

  def create
    run_house_cleaner
    window = time_window(params[:begin_time], params[:end_time])

    if logged_in?
      if params_not_empty(params[:date], params[:begin_time], params[:end_time], params[:budget], params[:location])
        api_response = create_itinerary_logged_in(params[:date], params[:begin_time], params[:end_time], params[:budget], params[:location])
        destroy_duplicate_activities(api_response)

        redirect_to "/itineraries/#{@itinerary.id}"
      else
        @errors = ["You must fill in all fields completely."]
        render 'new'
      end
    else
        redirect_to new_user_path
    end

  end

  def show
    @itinerary = Itinerary.find_by(id: params[:id])
    @activities = @itinerary.activities
    @promo_code = "PLANDUHFUN"

    @markers_hash = Gmaps4rails.build_markers(@activities) do |activity, marker|
      marker.lat activity.latitude
      marker.lng activity.longitude
      marker.infowindow activity.build_info_window
    end
  end

   def edit
    @itinerary = Itinerary.find_by(id: params[:id])
  end

  def update
    @itinerary = Itinerary.find_by(id: params[:id])
    @itinerary.update(:name => params[:itinerary_name], :confirmed? => true )

    if request.xhr?
      render json: @itinerary
    else
      redirect_to root_path
    end
  end

  def destroy
    @itinerary = Itinerary.find_by(id: params[:id])
    @itinerary.destroy

    redirect_to user_path(current_user)
  end

  def updated
  end


  private

  # YELP EVENT API METHODS
  def submit_events_api_call(budget, date, begin_time, end_time, location, itinerary)
    preferences_request = current_user.supplemental_preferences
    designated_preference = preferences_request.sample
    category_request = designated_preference.events_categories.sample
    start_date_time = user_input_to_unix(date, begin_time)
    end_date_time = user_input_to_unix(date, end_time)
    y = YelpResponse.new
    response = y.get_events_response({location: location, categories: category_request, start_date: start_date_time, end_date: end_date_time})
    if response["events"]
      event_budget = budget.to_i * 0.75
      filtered_response = response["events"].select do |event|
        event["cost"].to_i < event_budget.to_i || event["cost"] == nil
      end
      return_response = filtered_response.sample
    end
    handle_events_response(response, return_response, y, itinerary)
    y.destroy
  end

  def handle_events_response(response, return_response, y, itinerary)
    if response["error"]
      @error = "Sorry we're having a hard time finding an event for you. Please try again."
    else
      y.assign_event_values(return_response)
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
        filtered_response = response["businesses"].select { |business| business["rating"] >= 3 }
        response_container << filtered_response.sample
        response_convert_hash = {}
        response_convert_hash["businesses"] = response_container
        handle_businesses_response(response_convert_hash, y, itinerary, category_request_biz)
  end

  def handle_businesses_response(response, y, itinerary, category)
    if response["businesses"][0] != nil
      if response["error"]
        @error = "Sorry we're having a hard time finding a business for you. Please try again."
      else
        y.assign_business_values(response)
        set_business_attributes(y, itinerary, category)
      end
    end
  end

  def set_business_attributes(y, itinerary, category)
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
      category: category,
      version: "business"
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
    @client = GooglePlaces::Client.new(ENV["GOOGLE_PLACES_TOKEN"])
    initial_response = @client.spots(lat_long[0], lat_long[1], :types => google_places_request_types, :keywords => query, :radius => 2000)
    filtered_response = initial_response.delete_if { |response| response.types.include?("convenience_store") || response.rating == nil }
    sorted_response = filtered_response.sort_by { |response| response.rating }
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
      rating: response.rating || "unrated",
      price: response.price_level || "mystery",
      display_phone: response.formatted_phone_number || "mystery",
      url: response.website || "#",
      latitude: response.lat,
      longitude: response.lng,
      image_url: photo || "https://i.imgur.com/W29FmAv.png",
      display_address: response.formatted_address || "mystery",
      business_hours: response.opening_hours || "mystery",
      itinerary_id: itinerary.id,
      version: "google_place"
    )
  end

  def sample_business_or_events_search
    sample_type = []
    sample_type << submit_events_api_call(params[:date], params[:begin_time], params[:end_time], params[:location], @itinerary)
    sample_type << submit_business_api_call(params[:date], params[:begin_time], params[:location], @itinerary)
    sample_type.sample
  end

  def create_itinerary_logged_in(date, begin_time, end_time, budget, location)
     @itinerary = Itinerary.create(user: current_user, date: date, begin_time: begin_time, end_time: end_time, budget: budget, location: location)
      # create time window
      window = time_window(begin_time, end_time)
      # get latitude and longitude of location
      lat_long = create_lat_long_coordinates(location)
      i = 0
      while i < window
        yelp_event_response = submit_events_api_call(budget, date, begin_time, end_time, location, @itinerary)
        if yelp_event_response.name != nil
          i += 1
        end
        if @itinerary.activities.length < i
          yelp_business_response = submit_business_api_call(date, begin_time, budget, location, @itinerary)
          if yelp_business_response != nil
            i += 1
          end
        end
        if @itinerary.activities.length < i
          google_places_response = submit_google_places_api_call(lat_long, @itinerary)
          if google_places_response != nil
            i += 1
          end
        end
      end
      return @itinerary
  end

  def params_not_empty(date, begin_time, end_time, budget, location)
    if date.empty? || begin_time.empty? || end_time.empty? || budget.empty? || location.empty?
      return false
    else
      return true
    end
  end

  def run_house_cleaner
    if current_user.itineraries
      unconfirmed_itineraries = current_user.itineraries.where(confirmed?: false)
      unconfirmed_itineraries.destroy_all if unconfirmed_itineraries
    end
  end

  def destroy_duplicate_activities(itinerary)
      activities = Activity.where(itinerary: itinerary)
      grouped_activities = activities.group_by { |activity| activity.name}
      grouped_activities.values.each do |duplicates|
        first_one = duplicates.shift
        duplicates.each { |repeated_activity| repeated_activity.destroy }
      end
  end

end
