class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true
  validates_presence_of :email, :first_name, :last_name
end
