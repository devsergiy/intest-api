class Movie < ActiveRecord::Base
  has_many :person_movies

  with_options through: :person_movies, source: :person do
    has_many :directors, -> { where person_movies: {person_role: :director} }
    has_many :writers,   -> { where person_movies: {person_role: :writer} }
    has_many :actors,    -> { where person_movies: {person_role: :actor} }
  end

  validates :idimdb, scope: :user_id
end
