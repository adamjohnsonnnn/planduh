class YelpResponse < ApplicationRecord

  # def initialize(args={})
  #   @name = args.fetch(:name, "")
  #   @display_address = args.fetch(:display_address, "")
  #   @time_start = args.fetch(:time_start, "")
  #   @event_site_url = args.fetch(:event_site_url, "")
  #   @tickets_url = args.fetch(:tickets_url, "")
  #   @cost = args.fetch(:cost, 0)
  #   @cost_max = args.fetch(:cost_max, 0)
  #   @image_url = args.fetch(:image_url, "")
  # end

  def get_events_response(args={})
    url = "https://api.yelp.com/v3/events"

    query = {
      "location" => args.fetch(:location, ""),
      "categories" => args.fetch(:categories, ""),
      "start_date" => args.fetch(:start_date, ""),
      "is_free" => args.fetch(:is_free, false),
      "limit" => 1
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

  def assign_values(response)
    self.name = response["events"][0]["name"]
    self.time_start = response["events"][0]["time_start"]
    self.event_site_url = response["events"][0]["event_site_url"]
    self.tickets_url = response["events"][0]["tickets_url"]
    self.cost = response["events"][0]["cost"]
    self.cost_max = response["events"][0]["cost_max"]
    self.image_url = response["events"][0]["image_url"]
    self.is_free = response["events"][0]["is_free"]
    self.is_canceled = response["events"][0]["is_canceled"]
    format_and_set_address(response)
  end

  def format_and_set_address(response)
    address_array = response["events"][0]["location"]["display_address"]
    address_string = ""
    address_array.each { |part| address_string += part + " "}
    self.display_address = address_string.strip
  end

end
