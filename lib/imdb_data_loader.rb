require 'imdb'

class ImdbDataLoader
  def load
    movies = Imdb::Top250.new.movies

    movies.each_slice(50) do |slice|
      ActiveRecord::Base.transaction do
        slice.each do |m|
          Movie.find_or_create_by(idimdb: m.id) do |movie|
            movie.title  = m.title
            movie.year   = m.year
            movie.rating = m.rating
            movie.actors =  m.cast_members
            movie.director = m.director
          end
        end
      end
    end
  end
end
