class UserResponse < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :survey_question, optional: true

  validates :response, uniqueness: {:scope => :user_id}
end
