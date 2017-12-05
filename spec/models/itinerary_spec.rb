require 'rails_helper'

RSpec.describe Itinerary, type: :model do

  include ApplicationHelper

    let(:user) {User.create!(:first_name => "Winnie", :last_name => "Mele", :email=> "winnie@no.com", :password => 'password')}

    let(:itinerary) { Itinerary.create!(name: "Paris", location: "1033 W Van Buren, Chicago IL", :user_id => user.id, :confirmed? => true, :budget => 120, :date => "17/12/05", :begin_time => "22:09", :end_time => "12:00" )}

  describe 'itinerary attributes' do

    it 'an itinerary has a name' do
        expect(itinerary.name).to eq "Paris"
    end

    it 'an itinerary is associated with a user' do
        expect(itinerary.user_id).to eq user.id
    end

    it 'an itinerary has a confirmation attribute set to a boolean' do
        expect(itinerary.confirmed?).to be true
    end

    it 'an itinerary has an integer value for the budget' do
        expect(itinerary.budget).to be_a(Integer)
    end

    # it 'an itinerary has a properly formatted date' do
    #     today = Date.today
    #     p today
    #     expect(itinerary.date).should == today
    # end

    it 'an itinerary has a properly start and end time' do
        expect(itinerary.begin_time).to be_truthy
    end


  end

end
