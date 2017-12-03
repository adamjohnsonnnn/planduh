class UserResponse < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :survey_question, optional: true

  validates_uniqueness_of :response, scope: [:survey_question_id]
end
