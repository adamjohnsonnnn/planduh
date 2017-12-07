require 'rails_helper'


RSpec.describe UsersController do

  let(:dude) {User.create!(:first_name => "Winnie", :last_name => "Mele", :email=> "winnie@no.com", :password => 'password', :agreed => true)}



  describe "GET #SHOW" do
    it "responds with status code 200" do
      p UsersController.action_methods
      get :show
      expect(response).to have_http_status(200)
    end
  end
end
