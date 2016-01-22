class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :rating, :user_rating, :director, :actors

  def director
    object.director ? object.director.join(",") : ''
  end

  def actors
    object.actors ? object.actors.join(",") : ''
  end
end
