require 'rails_helper'

RSpec.describe ItinerariesController, type: :controller do

  let(:user) {User.create!(:first_name => "Mitch", :last_name => "Mele", :email=> "mitch@no.com", :password => 'password')}

  let(:itinerary) { Itinerary.create!(name: "Paris", location: "1033 W Van Buren, Chicago IL", :user_id => user.id, :confirmed? => true, :budget => 120, :date => "17/12/11", :begin_time => "22:09", :end_time => "12:00" )}

 describe "GET #index" do
    it "responds with status code 302" do
      get :new
      expect(response).to have_http_status(302)
  end
 end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, params: {id: itinerary.id }
      expect(response).to have_http_status(200)
  end




 end
end
