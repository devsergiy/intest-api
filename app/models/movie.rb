class Movie < ActiveRecord::Base
  validates :idimdb, uniqueness: { scope: :user_id }
end
