class YelpResponse

  def get_events_response(args={})
    url = "https://api.yelp.com/v3/events"

    query = {
      "location" = args.location,
      "categories" = args.categories,
      "start_date" = args.start_date,
      "limit" = args.limit
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

end
