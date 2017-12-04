class User < ApplicationRecord

	has_secure_password

	validates :first_name, :last_name, :email, presence: true

  has_many :preferences
  has_many :user_responses
  has_many :survey_responses, through: :user_responses


  def necessary_preferences
  	self.preferences.select { |preference| preference.is_necessary? == true }
  end

  def supplemental_preferences
  	self.preferences.select { |preference| preference.is_necessary? == false }
  end

  def submitted_preferences 
  	supplemental_preferences = self.supplemental_preferences
  	submitted_preferences = supplemental_preferences.sample(rand(supplemental_preferences.length))
  	submitted_preferences = submitted_preferences + self.necessary_preferences
  	return submitted_preferences
  end

end
