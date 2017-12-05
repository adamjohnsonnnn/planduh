require 'rails_helper'

RSpec.describe SurveyQuestion, type: :model do
    let(:question) {SurveyQuestion.new(:question_text => 'Do you have any dietary restrictions?', :version => "Open-ended")}


  describe "Survey Responses" do

     it "a Survey question has a question for the user" do
         expect(question.question_text).to eq "Do you have any dietary restrictions?"
     end

     it "the survey question type is a string" do
         expect(question.question_text).to be_a(String)
     end
  end

end
