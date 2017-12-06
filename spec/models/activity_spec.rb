require 'rails_helper'

RSpec.describe Activity, type: :model do

  let(:activity) {Activity.create!(:name => "Golf", :display_address => "1033 W Van Buren", :cost => 150, :itinerary_id => itinerary.id)}

   let(:user) {User.create!(:first_name => "Winnie", :last_name => "Mele", :email=> "winnie@no.com", :password => 'password')}

  let(:itinerary) { Itinerary.create!(name: "Paris", location: "1033 W Van Buren, Chicago IL", :user_id => user.id, :confirmed? => true, :budget => 120, :date => "17/12/05", :begin_time => "22:09", :end_time => "12:00" )}

  describe 'Activity Attributes' do

    it 'the activity is named' do
      expect(activity.name).to eq 'Golf'
    end

  end
end
