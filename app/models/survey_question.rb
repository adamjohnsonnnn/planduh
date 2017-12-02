class SurveyQuestion < ApplicationRecord
  paginates_per 1

  has_many :responses, class_name: "SurveyResponse"
  has_many  :user_responses

end
