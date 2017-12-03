class Preference < ApplicationRecord
  belongs_to :user

 serialize :events_categories
 serialize :business_categories
 serialize :keywords

end
