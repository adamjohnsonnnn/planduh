require 'rails_helper'


RSpec.describe UsersController, type: :controller do

  let(:user) {User.create!(:first_name => "Winnie", :last_name => "Mele", :email=> "winnie@no.com", :password => 'password')}



 describe "GET #SHOW" do

    it "responds with status code 200" do
      get :show
      expect(response).to have_http_status(200)
  end


 end
end
