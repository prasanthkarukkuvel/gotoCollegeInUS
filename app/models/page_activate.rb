class PageActivate < ActiveRecord::Base
  attr_accessible :admin_user_id, :key, :note, :page_id
  validates_uniqueness_of :key,:page_id,:note
  validates :key, presence: true
  validates :page_id, presence: true
  validates :admin_user_id, presence: true
end
