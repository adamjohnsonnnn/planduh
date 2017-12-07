require 'spec_helper'

describe 'test API request' do

  context "when provided an argument hash" do
    it 'returns a recommendation' do
      yelp_client = YelpResponse.new({location: "chicago", categories: "restaurant"})

      response = yelp_client.get_events_response(yelp_client)
      p response
      p "&&&&&&&&&&&&&&&&&&&&&&&&&"
      p yelp_client
      expect(response).to be_an_instance_of(Hash)
      expect(response['name']).to be_an_instance_of(String)
      expect(response['name'].length).to_eq 1
   end
  end

  context "when not pass an argument" do
    it 'returns a recommendation' do
      yelp_client = YelpResponse.new

      response = yelp_client.get_events_response()

      expect(response).to be_an_instance_of(Hash)
      expect(response['categories']).to be_an_instance_of(Array)
      expect(response['categories'].size).to >= 0
   end

  end

end
