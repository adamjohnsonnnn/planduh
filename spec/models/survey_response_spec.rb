 require 'rails_helper'

 RSpec.describe SurveyResponse, type: :model do    RSpec.describe SurveyResponse, type: :model do

  let(:answer) {SurveyResponse.new(:response => 'Vegan, no salt', :survey_question_id => 1)}

  describe 'Survey Responses' do

    it "a Survey response has a response for the user" do
         expect(answer.response).to eq "Vegan, no salt"
    end

    it "a Survey response is associated with a specific survey question" do
         expect(answer.survey_question_id).to eq 1
    end

    it "a Survey response returns a string for an answer" do
         expect(answer.response).to be_a(String)
    end

  end
 end
