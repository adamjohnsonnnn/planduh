class UserResponse < ApplicationRecord

  belongs_to :user
  belongs_to :survey_response
end
