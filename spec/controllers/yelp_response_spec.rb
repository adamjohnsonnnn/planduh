require 'spec_helper'

describe 'test API request' do
  context "when provided an argument hash" do
    it 'returns a recommendation' do

    yelp_client = YelpResponse.new({})

      response = yelp_client.get_businesses_response(name: "food", location: "Chicago", time_start: nil, event_site_url: nil, tickets_url: nil, cost: nil, cost_max: nil, is_free: nil, is_canceled: nil, image_url: nil, rating: nil, price: nil, display_phone: nil, title: nil, url: nil, latitude: nil, longitude: nil)

      expect(response).to be_an_instance_of(Hash)
      expect(response).to be_truthy

   end
  end

  context "when not pass an argument" do
    it 'returns a recommendation' do
      yelp_client = YelpResponse.new

      response = yelp_client.get_businesses_response()

      expect(response).to be_an_instance_of(Hash)
      expect(response['categories']).not_to be_an_instance_of(Array)

   end

  end

end
