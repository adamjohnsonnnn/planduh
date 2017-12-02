class YelpResponse

  def initialize(args={})
    @name = args.fetch(:name) || ""
    @display_address = args.fetch(:display_address) || ""
    @time_start = args.fetch(:time_start) || ""
    @event_site_url = args.fetch(:event_site_url) || ""
    @tickets_url = args.fetch(:tickets_url) || ""
    @cost = args.fetch(:cost) || 0
    @cost_max = args.fetch(:cost_max) || 0
    @image_url = args.fetch(:image_url) || ""
  end

  def get_events_response(args={})
    url = "https://api.yelp.com/v3/events"

    query = {
      "location" = args.location,
      "categories" = args.categories,
      "start_date" = args.start_date,
      "limit" = 1
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

  def self.assign_values(response)
    self.name = response["events"][0]["name"]
    self.display_address = response["events"][0]["location"]["display_address"].join
    self.time_start = response["events"][0]["time_start"]
    self.event_site_url = response["events"][0]["event_site_url"]
    self.tickets_url = response["events"][0]["tickets_url"]
    self.cost = response["events"][0]["cost"]
    self.cost_max = response["events"][0]["cost_max"]
    self.image_url = response["events"][0]["image_url"]
  end

end
