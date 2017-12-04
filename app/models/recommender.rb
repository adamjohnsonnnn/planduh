class Recommender < ApplicationRecord

	serialize :event_matrix
	serialize :business_matrix

end
