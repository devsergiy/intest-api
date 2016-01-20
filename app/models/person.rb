class Person < ActiveRecord::Base
  has_many :person_movies
  has_many :movies, -> { distinct(true) }, through: :person_movies
end
