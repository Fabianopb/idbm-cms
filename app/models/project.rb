class Project < ActiveRecord::Base

	has_and_belongs_to_many :users

	scope :sorted, lambda { order("projects.id ASC") }

	def members
        (self.users.pluck(:first_name, :last_name).map {|user| user.join(' ')}).join(', ')
    end

end
