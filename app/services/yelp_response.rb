class YelpResponse < ApplicationRecord

  def get_events_response(args={})
    url = "https://api.yelp.com/v3/events"

    query = {
      "location" => args.fetch(:location, ""),
      "categories" => args.fetch(:categories, ""),
      "start_date" => args.fetch(:start_date, ""),
      "end_date" => args.fetch(:end_date, ""),
      "is_free" => args.fetch(:is_free, false),
      "limit" => 20,
      "radius" => 4500
    }

    headers = {
      # take the api key out later...
      "Authorization" => "Bearer 1-SKzUHoUM5qUPfnCyYJTGYGfqCA66MtD66A8le4f8QGH8dj1_s_vGpZNxKppBwm8NsasLD72iVoSzCq1G0QGAg2IJezrUToU0EmsGo8rHpEmVcRBzjdTl_wA84gWnYx"
    }

    response = HTTParty.get(
      url,
      :query => query,
      :headers => headers
    )

    buffer = response.body
    result = JSON.parse(buffer)
  end

  def get_businesses_response(args={})
    url = "https://api.yelp.com/v3/businesses/search"

    query = {
      "term" => args.fetch(:term, ""),
      "location" => args.fetch(:location, ""),
      "categories" => args.fetch(:categories, ""),
      "open_at" => args.fetch(:open_at, ""),
      "price" => args.fetch(:price, false),
      "limit" => 10,
      "radius" => 7500
    }

    headers = {
      # take the api key out later...
      "Authorization" => "Bearer 1-SKzUHoUM5qUPfnCyYJTGYGfqCA66MtD66A8le4f8QGH8dj1_s_vGpZNxKppBwm8NsasLD72iVoSzCq1G0QGAg2IJezrUToU0EmsGo8rHpEmVcRBzjdTl_wA84gWnYx"
    }

    response = HTTParty.get(
      url,
      :query => query,
      :headers => headers
    )

    buffer = response.body
    result = JSON.parse(buffer)
  end

  def assign_event_values(response)
    self.name = response["events"][0]["name"] || ""
    self.time_start = response["events"][0]["time_start"] || ""
    self.event_site_url = response["events"][0]["event_site_url"] || ""
    self.tickets_url = response["events"][0]["tickets_url"] || ""
    self.cost = response["events"][0]["cost"] || ""
    self.cost_max = response["events"][0]["cost_max"] || ""
    self.image_url = response["events"][0]["image_url"] || ""
    self.is_free = response["events"][0]["is_free"] || ""
    self.is_canceled = response["events"][0]["is_canceled"] || ""
    self.latitude = response["events"][0]["latitude"] || ""
    self.longitude = response["events"][0]["longitude"] || ""
    format_and_set_address(response)
  end

  def assign_business_values(response)
    self.name = response["businesses"][0]["name"] || ""
    self.rating = response["businesses"][0]["rating"] || ""
    self.price = response["businesses"][0]["price"] || ""
    self.title = response["businesses"][0]["categories"][0]["title"] || ""
    self.url = response["businesses"][0]["url"] || ""
    self.latitude = response["businesses"][0]["coordinates"]["latitude"] || 0
    self.longitude = response["businesses"][0]["coordinates"]["longitude"] || 0
    self.image_url = response["businesses"][0]["image_url"] || ""
    self.display_phone = response["businesses"][0]["display_phone"] || ""
    format_and_set_address(response)
  end

  def format_and_set_address(response)
    if self.rating
      address_array = response["businesses"][0]["location"]["display_address"]
    else
      address_array = response["events"][0]["location"]["display_address"]
    end
    address_string = ""
    address_array.each { |part| address_string += part + " "}
    self.display_address = address_string.strip
  end

end
