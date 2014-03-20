class UserInfo < ActiveRecord::Base

  attr_accessible :address1, :address2, :city, :college, :country, :gre, :pincode, :state, :toefl, :transit, :user_id, :yearofpassing

  validates :address1,length: { minimum: 1, maximum: 200 }
  validates :address2,length: { minimum: 1, maximum: 200 }
  validates :city,length: { minimum: 1, maximum: 30 }
  validates :college,length: { minimum: 1, maximum: 30 }
  validates :country,length: { minimum: 1, maximum: 30 }
  validates :gre,length: { minimum: 1, maximum: 10 }
  validates :pincode,length: { minimum: 2, maximum: 15 }
  validates :state,length: { minimum: 1, maximum: 30 }
  validates :toefl,length: { minimum: 1, maximum: 10 }
  validates :transit,length: { minimum: 1, maximum: 10 }
  validates :user_id,presence: true

end
