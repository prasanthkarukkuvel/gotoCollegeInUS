class Professor < ActiveRecord::Base
  extend FriendlyId
  friendly_id :key, use: :slugged

  attr_accessible :contact, :department, :designation, :email, :firstname, :lastname, :password, :username,:key,:slug,:isactive

  validates_uniqueness_of :email,:key,:username

  has_attached_file :photo,
                  :url => "/people/:class/:attachment/:id/:attachment_:style.:extension",
                  :path => ":rails_root/public/people/:class/:attachment/:id/:attachment_:style.:extension",
                  :default_url => "/user/default_medium_male.png",
                  :styles => {
                        :thumb => "32x32",
                        :small  => "40x40",
                        :medium => "160x160" }      


  def should_generate_new_friendly_id?
   new_record?
  end 

   define_index do
    indexes [firstname,lastname], as: :name
    set_property :enable_star => 1
    set_property :min_infix_len => 1
    where "professors.isactive = 1"
   end
  

end
