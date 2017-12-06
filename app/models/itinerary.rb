class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy

  validates :date, :begin_time, :end_time, :budget, :location, presence: true

end
