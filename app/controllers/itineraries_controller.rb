class ItinerariesController < ApplicationController
  def new
  end

  def create
  end

  def show
    y = YelpResponse.new
    response = y.get_events_response({location: "chicago", categories: "visual-arts", start_date: 1512185212})
    y.assign_values(response)

    @activity = Activity.create!(
      name: y.name,
      display_address: y.display_address,
      time_start: y.time_start,
      event_site_url: y.event_site_url,
      tickets_url: y.tickets_url,
      cost: y.cost,
      cost_max: y.cost_max,
      image_url: y.image_url,
      itinerary_id: 1
    )
  end

  def destroy
  end

  def updated
  end
end
