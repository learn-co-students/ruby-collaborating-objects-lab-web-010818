class Song

  attr_accessor :name, :artist, :genre

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(import)
    split_track = import.split(" - ")
    artist = Artist.find_or_create_by_name(split_track[0])
    new_song = Song.new(split_track[1])
    new_song.artist = artist
    new_song.genre = split_track[2].chomp(".mp3")
    artist.add_song(new_song)
    new_song
  end

end
