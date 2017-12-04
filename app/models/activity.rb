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

  def build_info_window
    if self.version == "business"
      activity_info = "<h5>#{self.name}</h5>
                      <p>#{self.display_address}</p>
                      <a href=#{self.url}>Visit Website</a>"
    elsif self.version == "event"
      activity_info = "<h5>#{self.name}</h5>
                      <p>#{self.display_address}</p>
                      <a href=#{self.event_site_url}>Visit Website</a>"
    elsif self.version == "google_place"
      activity_info = "<h5>Google Places Result</h5>
                      <p>Make sure to add info</p>
                      <a href=#>Visit Website</a>"
    end
    activity_info
  end

end
