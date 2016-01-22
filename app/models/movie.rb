class Movie < ActiveRecord::Base
  scope :for_user, -> (user) { where(user_id: [nil, user]) }

  validates_presence_of :title

  after_create :sync_data, if: :data_incomplete?

  ATTRS_TO_SYNC = {
    idimdb:   :id,
    title:    :title,
    year:     :year,
    rating:   :rating,
    actors:   :cast_members,
    director: :director,
  }.freeze

  def sync_data
    movie = Imdb::Search.new(title).movies.first
    ATTRS_TO_SYNC.keys.each do |key|
      if self.send(key).blank?
        self.write_attribute(key, movie.send(ATTRS_TO_SYNC[key]))
      end
    end
    self.save
  end

  def data_incomplete?
    ATTRS_TO_SYNC.keys.any? {|key| self.send(key).blank? }
  end
end

