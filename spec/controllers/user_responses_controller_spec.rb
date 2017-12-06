require 'rails_helper'


RSpec.describe UserResponsesController, type: :controller do

  let(:user) {User.create!(:first_name => "Winnie", :last_name => "Mele", :email=> "winnie@no.com", :password => 'password', :agreed => true)}

  let(:user_response) { UserResponse.create!(response: "Paris", survey_question_id: 1, :user_id => user.id)}


 describe "GET #POST" do

    it "responds with status code 302" do
      p user_response
      post :create, params: {response: "Paris", survey_question_id: 1, :user_id => user.id}
      expect(response).to have_http_status(302)
  end


 end
end
