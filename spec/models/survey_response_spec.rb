require 'rails_helper'

RSpec.describe SurveyResponse, type: :model do
  let(:answer) {SurveyAnswer.new(:response => 'Vegan, no salt', :survey_question_id => "1")}



end
