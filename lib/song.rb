require_relative './artist'

class Song
  attr_accessor :name, :artist, :genre

  def initialize(name)
    @name = name
  end

  def artist=(artist)
    @artist = artist
  end

  def self.new_by_filename(file_name)
    file = file_name.split(" - ")
    artist_name = file[0]
    song_name = file[1]
    genre = file[2].split(".").first

    new_song = self.new(song_name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_song.artist.add_song(new_song)
    new_song.genre = genre
    new_song
  end
end
