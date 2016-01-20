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
          movie.meta   = m

          movie.directors = find_or_create_persons(m["directors"], :director)
          movie.writers   = find_or_create_persons(m["writers"], :writer)
        end
      end
    end
  end

  private

    def find_or_create_persons(data, role)
      return [] if data.blank?

      data.inject([]) do |memo, person|
        memo << Person
          .create_with(name: person["name"])
          .find_or_create_by(nameid: person["nameId"])
        memo
      end
    end
end
