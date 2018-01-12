class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    file_name_arr = file_name.slice(0, (file_name.length - 4)).split(" - ")
    artist_name = file_name_arr[0]
    song_name = file_name_arr[1]

    new_song = Song.new(song_name)
    new_song.add_artist_by_name=(artist_name)
    new_song
  end

  def add_artist_by_name=(name)
    a = Artist.find_or_create_by_name(name)
    a.add_song(self)
    @artist = a
    a
  end
end
