require 'rails_helper'

RSpec.describe User, type: :model do

 let(:user) {User.new(:first_name => "Mitch", :last_name => "Mele", :email=> "mitch@no.com", :password => 'password')}

  describe "user props" do
    it "a user has a first name" do
      expect(user.first_name).to eq "Mitch"
  end

   it "a user has a last_name" do
      expect(user.last_name).to eq "Mele"
  end

   it "a user has an email" do
      expect(user.email).to eq "mitch@no.com"
  end


   it "a user has a last_name" do
      expect(user.password).to eq "password"
  end

 end

end
