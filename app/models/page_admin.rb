class PageAdmin < ActiveRecord::Base
  attr_accessible :contact, :email, :name, :page_id,:username,:password
  validates_uniqueness_of :email,:contact,:username
  validates :email, presence: true,length: { minimum: 4, maximum: 200 }
  validates :contact, presence: true,length: { minimum: 6, maximum: 20 }
  validates :name, presence: true,length: { minimum: 1, maximum: 200 }

  belongs_to :page
end
