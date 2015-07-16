class Exercise < ActiveRecord::Base
  belongs_to :user
  validates :name, :presence => true
  validates :burned, :presence => true
end
