# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

# SurveyQuestion.create!(:question_text => 'If you had a day off work, which one of these activities would appeal most to you? ')
question_0 = SurveyQuestion.create!(:question_text => 'Do you have any dietary restrictions?', :version => "Open-ended")
question_1 = SurveyQuestion.create!(:question_text => 'Do you like physical activity?', :version => "Yes/No")
question_2 = SurveyQuestion.create!(:question_text => 'Do you like to drink?', :version => "Yes/No")
question_5 = SurveyQuestion.create!(:question_text => 'How do you feel about being outdoors?', :version => "Multiple Choice")
question_6 = SurveyQuestion.create!(:question_text => '
Would you visit Paris, the YellowStone, or Las Vegas if given a free trip weekend trip?', :version => "Multiple Choice")

question_7 = SurveyQuestion.create!(:question_text => 'If you had a free day off of work, which one of these activities would appeal the most to you?', :version => "Multiple Choice")

question_8 = SurveyQuestion.create!(:question_text => 'What is your favorite type of music?', :version => "Multiple Choice")


response_1 = SurveyResponse.create!(:response => "Yes, I'm very active!", :survey_question => question_1)
response_2 = SurveyResponse.create!(:response => "No...I don't prefer physical activity for my events", :survey_question => question_1)
response_3 = SurveyResponse.create!(:response => 'Yes, pour me a cold one', :survey_question => question_2)
response_4 = SurveyResponse.create!(:response => 'No, not much of a drinker these days', :survey_question => question_2)
response_11 = SurveyResponse.create!(:response => 'Love it', :survey_question => question_5)
response_15 = SurveyResponse.create!(:response => 'ehhh, only if it is nice out', :survey_question => question_5)
response_16 = SurveyResponse.create!(:response => 'I prefer to be inside whenever possible', :survey_question => question_5)
response_18 = SurveyResponse.create!(:response => 'Go day drinking at a bar', :survey_question => question_7)
response_19 = SurveyResponse.create!(:response => 'Visit a museum ', :survey_question => question_7)
response_20 = SurveyResponse.create!(:response => 'Ride bike or go for a run ', :survey_question => question_7)
response_21 = SurveyResponse.create!(:response => 'Play board games or work on a puzzle', :survey_question => question_7)
response_22 = SurveyResponse.create!(:response => 'Paris', :survey_question => question_6)
response_23 = SurveyResponse.create!(:response => 'YellowStone', :survey_question => question_6)
response_24 = SurveyResponse.create!(:response => 'Las Vegas', :survey_question => question_6)
response_25 = SurveyResponse.create!(:response => 'Classic Rock', :survey_question => question_8)
response_26 = SurveyResponse.create!(:response => 'Indie', :survey_question => question_8)
response_28 = SurveyResponse.create!(:response => 'Electronic', :survey_question => question_8)
response_29 = SurveyResponse.create!(:response => 'Hip Hop', :survey_question => question_8)
response_30 = SurveyResponse.create!(:response => "I'm down for anything!"  , :survey_question => question_8)
response_30 = SurveyResponse.create!(:response => "N/A"  , :survey_question => question_8)
response_31 = SurveyResponse.create!(:response => nil  , :survey_question => question_0)

User.create!(first_name: "Jimbo", last_name: "Fancy", email: "jbo@woof.bork", password: "asdf1234")
Itinerary.create!(confirmed?: true, user_id: 1)
