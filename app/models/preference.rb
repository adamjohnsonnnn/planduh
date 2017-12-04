class Preference < ApplicationRecord
  belongs_to :user

 serialize :events_categories
 serialize :business_categories
 serialize :keywords
 serialize :google_places_types

end
