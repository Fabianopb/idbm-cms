class Project < ActiveRecord::Base

	has_many :users

	scope :sorted, lambda { order("projects.id ASC") }

end
