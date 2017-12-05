class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :activities

  validates :date, :begin_time, :end_time, :budget, :location, presence: true

end
