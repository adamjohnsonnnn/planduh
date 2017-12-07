SurveyQuestion.destroy_all
SurveyResponse.destroy_all
Recommender.destroy_all

# SurveyQuestion.create!(:question_text => 'If you had a day off work, which one of these activities would appeal most to you? ')
question_0 = SurveyQuestion.create!(:question_text => 'Do you have any dietary restrictions?', :version => "Open-ended")
question_1 = SurveyQuestion.create!(:question_text => 'Do you like physical activity?', :version => "Yes/No")
question_2 = SurveyQuestion.create!(:question_text => 'Would you enjoy a cocktail?', :version => "Yes/No")
question_5 = SurveyQuestion.create!(:question_text => 'How do you feel about being outdoors?', :version => "Multiple Choice")
question_6 = SurveyQuestion.create!(:question_text => 'Given a choice, would you visit Paris, YellowStone, or Las Vegas?', :version => "Multiple Choice")
question_7 = SurveyQuestion.create!(:question_text => 'Which of these activities appeal most to you?', :version => "Multiple Choice")
question_8 = SurveyQuestion.create!(:question_text => 'What is your favorite genre of music?', :version => "Multiple Choice")

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

recommender = Recommender.create!(event_matrix: {
		hours: {
		1 => ['food-and-drink', 'nightlife'],
		2 => ['food-and-drink', 'nightlife'],
		3 => ['food-and-drink', 'nightlife'],
		4 => ['food-and-drink', 'nightlife'],
		5 => ['food-and-drink', 'nightlife'],
		6 => ['food-and-drink', 'sports-active-life'],
		7 => ['food-and-drink', 'sports-active-life'],
		8 => ['food-and-drink', 'food-and-drink', 'sports-active-life'],
		9 => ['food-and-drink', 'visual-arts', 'performing-arts', 'lectures-books', 'fashion', 'sports-active-life', 'festivals-fairs'],
		10 => ['visual-arts', 'performing-arts', 'lectures-books', 'fashion', 'sports-active-life', 'festivals-fairs'],
		11 => ['food-and-drink','music', 'visual-arts', 'performing-arts', 'lectures-books', 'fashion', 'sports-active-life', 'festivals-fairs'],
		12 => ['food-and-drink', 'food-and-drink', 'food-and-drink', 'sports-active-life', 'festivals-fairs'],
		13 => ['food-and-drink', 'food-and-drink', 'sports-active-life', 'festivals-fairs'],
		14 => ['music', 'visual-arts', 'performing-arts', 'lectures-books', 'fashion', 'sports-active-life', 'festivals-fairs'],
		15 => ['film', 'visual-arts', 'performing-arts', 'lectures-books', 'fashion', 'sports-active-life', 'festivals-fairs'],
		16 => ['film', 'visual-arts', 'performing-arts', 'lectures-books', 'fashion', 'sports-active-life', 'festivals-fairs'],
		17 => ['film', 'visual-arts', 'performing-arts', 'lectures-books', 'fashion'],
		18 => ['music', 'film', 'food-and-drink'],
		19 => ['music', 'film', 'food-and-drink', 'food-and-drink', 'food-and-drink'],
		20 => ['music', 'film', 'food-and-drink', 'food-and-drink', 'nightlife'],
		21 => ['music', 'film', 'nightlife'],
		22 => ['music', 'film', 'nightlife'],
		23 => ['music', 'film', 'nightlife'],
		24 => ['music', 'film', 'nightlife']
		}
	}, business_matrix: {
		hours: {
		1 => ['nightlife'],
		2 => ['nightlife'],
		3 => ['nightlife'],
		4 => ['nightlife'],
		5 => ['active','nightlife'],
		6 => ['active'],
		7 => ['active', 'restaurants', 'massage_therapy'],
		8 => ['active', 'restaurants', 'restaurants', 'restaurants'],
		9 => ['active', 'arts', 'beautysvc', 'localflavor'],
		10 => ['active', 'arts', 'beautysvc', 'localflavor', 'shopping'],
		11 => ['active', 'arts', 'beautysvc', 'localflavor', 'shopping'],
		12 => ['restaurants', 'restaurants','localflavor'],
		13 => ['restaurants', 'restaurants', 'restaurants', 'active', 'arts', 'beautysvc', 'localflavor', 'shopping'],
		14 => ['active', 'arts', 'beautysvc', 'localflavor', 'shopping'],
		15 => ['active', 'arts', 'beautysvc', 'localflavor', 'shopping'],
		16 => ['active', 'arts', 'beautysvc', 'localflavor', 'shopping'],
		17 => ['arts', 'beautysvc', 'localflavor', 'shopping'],
		18 => ['arts', 'beautysvc', 'localflavor', 'shopping'],
		19 => ['arts', 'beautysvc', 'restaurants', 'restaurants', 'localflavor'],
		20 => ['restaurants', 'restaurants', 'restaurants', 'localflavor', 'nightlife'],
		21 => ['restaurants', 'localflavor', 'nightlife'],
		22 => ['localflavor', 'nightlife'],
		23 => ['nightlife'],
		24 => ['nightlife']
		}
	}
	)





