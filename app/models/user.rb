class User < ApplicationRecord

	has_secure_password

	validates :first_name, :last_name, :email, :agreed, presence: true
  validates_uniqueness_of :email

  has_many :preferences
  has_many :itineraries
  has_many :activities, through: :itineraries
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

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.forgot_password(self).deliver# This sends an e-mail with a link for the user to reset the password
  end
  # This generates a random password reset token for the user
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
