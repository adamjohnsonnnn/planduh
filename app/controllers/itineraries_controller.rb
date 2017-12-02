class ItinerariesController < ApplicationController
  def new
  end

  def create
  end

  def show
    yelpy = YelpResponse.new
    response = yelpy.get_events_response({location: "chicago", categories: "festivals-fairs", start_date: 1512185212})
    yelpy.assign_values(response)

  end

  def destroy
  end

  def updated
  end
end
