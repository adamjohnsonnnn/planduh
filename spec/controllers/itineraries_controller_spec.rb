require 'rails_helper'

RSpec.describe ItinerariesController, type: :controller do

  let(:user_r) { Itinerary.new(name: "Paris", location: "1033 W Van Buren, Chicago IL", :user_id => 1, :confirmed? => true)}

 describe "GET #index" do

    it "responds with status code 200" do
      p response
      get :new
      expect(response).to have_http_status(200)
  end
 end

  describe "GET #show" do

    it "responds with status code 200" do
      get :show, {id: user_r.id }
      expect(response).to have_http_status(200)
  end

 end
end
