class Page < ActiveRecord::Base
  attr_accessible :key, :status, :ptype
  validates_uniqueness_of :key
  has_attached_file :logo,
                  :url => "/people/:class/:attachment/:id/:attachment_:style.:extension",
                  :path => ":rails_root/public/people/:class/:attachment/:id/:attachment_:style.:extension",
                  :default_url => "/user/default_medium_male.png",
                  :styles => {
                        :thumb => "32x32",
                        :small  => "40x40",
                        :medium => "160x160" }
    has_one :page_admin
    has_one :page_info

    define_index do
    indexes [page_infos(:title),page_infos(:code)], as: :name
    indexes [page_infos(:city),page_infos(:state),page_infos(:pincode)], as: :location
    
    set_property :enable_star => 1
    set_property :min_infix_len => 1
    where "pages.status = 2"
  end
end
