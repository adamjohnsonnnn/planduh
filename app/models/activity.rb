class Activity < ApplicationRecord
  belongs_to :itinerary

  def format_date
    d = self.time_start.to_datetime
    d.strftime("%b %d, %Y")
  end

  def format_time
    d = self.time_start.to_datetime
    d.strftime("%I:%M %p")
  end

  def filter_cost
    if self.cost && self.cost > 0 && self.cost_max && self.cost_max > 0
      "#{self.cost}+"
    elsif self.cost && self.cost > 0
      self.cost
    elsif self.cost_max && self.cost_max > 0
      self.cost_max
    else
      " Free Event"
    end
  end

end
