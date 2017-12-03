class User < ApplicationRecord

	has_secure_password

	validates :first_name, :last_name, :email, presence: true

  has_many :preferences
  has_many :user_responses
  has_many :survey_responses, through: :user_responses

end
