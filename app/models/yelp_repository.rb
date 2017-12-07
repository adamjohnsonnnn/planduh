class YelpRepository
  def initialize(yelp_client)
    @yelp_client = yelp_client
  end

  def get_todos
    @yelp_client.get_events_response(args={})
  end
end
