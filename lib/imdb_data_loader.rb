class ImdbDataLoader
  def initialize(file_name)
    @json = JSON.parse(File.read(file_name))
  end

  def load
    ActiveRecord::Base.transaction do
      @json["data"]["movies"].each do |m|
        Movie.find_or_create_by(idimdb: m["idIMDB"]) do |movie|
          movie.title  = m["title"]
          movie.year   = m["year"].to_i
          movie.rating = m["rating"].to_f
        end
      end
    end
  end
end
