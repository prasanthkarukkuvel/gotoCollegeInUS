class PageInfo < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :address1, :address2, :city, :code, :fax, :pincode, :state, :title, :website,:page_id,:desc,:key

  validates_uniqueness_of :code,:website

  belongs_to :page

  def should_generate_new_friendly_id?
   new_record?
  end

   
end
