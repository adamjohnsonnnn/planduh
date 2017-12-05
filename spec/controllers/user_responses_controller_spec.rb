require 'rails_helper'


RSpec.describe UserResponsesController, type: :controller do

  let(:user_r) { UserResponse.new(response: "Paris", survey_question_id: 1, :user_id => 1)}

 describe "GET #index" do

    it "responds with status code 200" do
      post :create, :user_r => { response: "Paris", survey_question_id: 1, :user_id => 1 }
      expect(response).to have_http_status(302)
  end


 end
end
