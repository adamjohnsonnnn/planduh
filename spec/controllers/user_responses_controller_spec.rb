require 'rails_helper'


RSpec.describe UserResponsesController, type: :request do

  let(:user) {User.create!(:first_name => "Winnie", :last_name => "Mele", :email=> "winnie@no.com", :password => 'password')}

  let(:user_response) { UserResponse.create!(response: "Paris", survey_question_id: 1, :user_id => user.id)}


 describe "GET #POST" do


    it "responds with status code 302" do
      p user_response
      post "/user_responses", :params => { response: "Paris", survey_question_id: 1, :user_id => user.id  }
      expect(response).to have_http_status(302)
  end


 end
end
