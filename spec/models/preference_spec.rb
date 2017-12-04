require 'rails_helper'

RSpec.describe Preference, type: :model do



let(:preference) {Preference.new(:user_id => 8, :keywords => "night-life", :is_necessary? => true)}
let(:preference2) {Preference.new(:user_id => 3, :keywords => "food-drinks")}

let(:updated_preference) { Preference.new(:user_id => 5, :events_categories => ["nightlife","performing-arts", "lectures-books", "visual-arts"], :business_categories => ['nightlife', 'shopping', 'beautysvc'], :keywords => ["nightlife", "party", "social"])}


  describe "preference attributes" do

    it "a preference is tied to a user" do
     user= User.create!(:first_name => "Mitch", :last_name => "Mele", :email=> "mitch@no.com", :password => 'password')

      expect(preference.user_id).to eq 8
    end

    it "a preference registers a keyword" do
        expect(preference.keywords).to eq "night-life"
    end

    it "a preference is_necessary column defaults to false " do
        expect(preference2.is_necessary?).to be false
    end

    it "a preference has true for necessary fields if selected" do
        expect(preference.is_necessary?).to be true
    end
 end



  describe 'preference nested keyword categories' do

    it 'has a collection of strings as  categories ' do
      expect(updated_preference.events_categories.sample).to be_a(String)
    end

    it 'a preference contains 3 keywords' do
      expect(updated_preference.keywords.length).to eq 3
    end

    it 'a preferences business_categories contains the nightlife option' do
      expect(updated_preference.business_categories).to include("nightlife")
    end

    it 'a preferences events_categories contains the nightlife option' do
      expect(updated_preference.events_categories).to include("lectures-books")
    end

  end

end
