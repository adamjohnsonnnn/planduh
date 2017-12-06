class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy

  validates :date, :begin_time, :end_time, :budget, :location, presence: true
  # validate :window_large_enough



  # private
  # def window_large_enough
  #   window = time_window(:start_time, :end_time)
  #   window >= 1
  # end

end
