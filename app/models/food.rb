class Food < ActiveRecord::Base
  belongs_to :user
  validates :name, :presence => true
  validates :calories, :presence => true
  acts_as_list
end
