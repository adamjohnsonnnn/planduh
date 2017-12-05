require 'rails_helper'

RSpec.describe UserResponse, type: :model do

  let(:user) {User.create!(:first_name => "Mitch", :last_name => "Mele", :email=> "mitch@no.com", :password => 'password')}

  let(:user_response) { UserResponse.create!(response: "Paris", survey_question_id: 1, :user_id => user.id)}

  describe 'Response Attributes' do

    it 'a user response has a response field' do
      expect(user_response.response).to eq 'Paris'
    end

    it 'a user response is associated with a user' do
      expect(user_response.user_id).to eq user.id
  end

 end
end
