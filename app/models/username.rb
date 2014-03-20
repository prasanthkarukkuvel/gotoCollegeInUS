class Username < ActiveRecord::Base
  attr_accessible :name, :ntype
  validates_uniqueness_of :name
  validates :name, presence: true
  validates :ntype, presence: true
end
