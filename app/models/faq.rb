class Faq < ActiveRecord::Base
    
  acts_as_list
  
  scope :sorted, lambda { order("faqs.position ASC") }

  validates :question,
  					:answer,
  					presence: true
    
end
