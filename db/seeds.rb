# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# SurveyQuestion.create!(:question_text => 'Do you like to drink? ')
# SurveyQuestion.create!(:question_text => 'Do you like physical activity?  ')
# SurveyQuestion.create!(:question_text => 'How do you feel about being outdoors?  ')

# SurveyQuestion.create!(:question_text => '
# Would you visit Paris, the YellowStone, or Las Vegas if given a free trip weekend trip?  ')


# SurveyResponse.create!(:response => 'Paris', :survey_question_id => 4)

# SurveyResponse.create!(:response => 'YellowStone', :survey_question_id => 4)

# SurveyResponse.create!(:response => 'Las Vegas', :survey_question_id => 4)

SurveyResponse.create!(:response => 'Guitar', :survey_question_id => 5)
SurveyResponse.create!(:response => 'Jazz', :survey_question_id => 5)
SurveyResponse.create!(:response => 'Blues', :survey_question_id => 5)
SurveyResponse.create!(:response => 'Rap', :survey_question_id => 5)
