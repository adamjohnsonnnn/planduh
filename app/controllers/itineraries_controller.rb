class ItinerariesController < ApplicationController
  def new
  end

  def create
  end

  def show
    y = YelpResponse.new
    response = y.get_events_response({location: "chicago", categories: "film", start_date: 1512185212})

    if response["error"]
      @error = "Sorry we're having a hard time finding an event for you. Please try again."
    else
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
  end

  def destroy
  end

  def updated
  end

    # <li>Cost: $<%= @activity.cost %></li><br>
    # <li>Cost: $<%= @activity.cost_max %></li><br>
end
