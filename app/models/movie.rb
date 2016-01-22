class Movie < ActiveRecord::Base
  scope :for_user, -> (user) { where(user_id: [nil, user]) }
end
