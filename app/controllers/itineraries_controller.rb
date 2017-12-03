class ItinerariesController < ApplicationController
  def new
  end

  def create
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

    # @activities.each do |activity|
    #   p activity.name
    #   p activity.latitude.to_s
    #   p activity.longitude.to_s
    # end
  end

  def destroy
  end

  def updated
  end

  private
  def set_event_attributes(y)
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
      itinerary_id: 1,
      version: "event"
    )
  end

  def handle_events_response(response, y)
    if response["error"]
      @error = "Sorry we're having a hard time finding an event for you. Please try again."
    else
      y.assign_event_values(response)
      @activities << set_event_attributes(y)
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
