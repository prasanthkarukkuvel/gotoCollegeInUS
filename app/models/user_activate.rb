class UserActivate < ActiveRecord::Base
  attr_accessible :akey, :user_id
  validates_uniqueness_of :akey,:user_id
  validates :akey, presence: true
  validates :user_id, presence: true
end
