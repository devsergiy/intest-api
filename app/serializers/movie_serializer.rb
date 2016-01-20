class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :rating, :idimdb, :user_rating

  has_many :directors
end
