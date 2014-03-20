class User < ActiveRecord::Base

  scope :inactive,where(:isactive => true)
  extend FriendlyId
  friendly_id :key, use: :slugged

  attr_accessible :contact, :dob, :email, :gender, :key, :firstname, :lastname, :password, :slug, :username, :ispaid, :isactive

  validates_uniqueness_of :email,message:"Email already exits"
  validates_uniqueness_of :contact,message:"Contact number already exits"
  validates_uniqueness_of :username,message:"User creation failed"
  validates_uniqueness_of :slug,message:"User creation failed"
  validates_uniqueness_of :key,message:"User creation failed"

  validates :firstname, presence:true,length: { minimum: 3, maximum: 200,message:"/f101" }

  validates :lastname, presence: true,length: { minimum: 1, maximum: 200 }
  validates :email, presence: true,length: { minimum: 5, maximum: 200 }
  validates :contact, presence: true,length: { minimum: 6, maximum: 20 }
  validates :password, presence: true,length: { minimum: 6 }
  validates :dob, presence: true,length: { minimum: 1, maximum: 10 }
  validates :gender, presence: true
  validates :key, presence: true

  has_attached_file :photo,
  :url => "/people/:class/:attachment/:id/:attachment_:style.:extension",
  :path => ":rails_root/public/people/:class/:attachment/:id/:attachment_:style.:extension",
  :default_url => "/user/default_medium_male.png",
  :styles => {
    :thumb => "32x32",
    :small  => "40x40",
    :medium => "160x160" }                

  #validates_attachment_presence :photo
  #validates_attachment_size :photo,less_than:5.megabytes
  #validates_attachment_content_type :photo,content_type:['image/jpeg','image/png']

  has_one :user_info
  has_one :paid_user

  def should_generate_new_friendly_id?
   new_record?
 end

 define_index do
  indexes [firstname,lastname], as: :name
  set_property :enable_star => 1
  set_property :min_infix_len => 1
  where "users.isactive = 1"
end


end
