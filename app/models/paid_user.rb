class PaidUser < ActiveRecord::Base
  attr_accessible :user_id
  validates :user_id,presence: true

end
