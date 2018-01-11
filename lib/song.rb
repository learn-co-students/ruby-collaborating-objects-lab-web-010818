class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(title)
    @name = title
  end

  def artist=(artist_object)
    @artist = artist_object
  end

  def self.new_by_filename(filename)
    name_array = filename.split(" - ")
    new_song = self.new(name_array[1])
    new_artist = Artist.find_or_create_by_name(name_array[0])
    new_artist.add_song(new_song)
    new_song
  end
end
