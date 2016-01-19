class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :rating, :idimdb
end
