require 'pry'

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    song_text = filename.split(' - ') #[artist, song, genre]
    new_song = Song.new(song_text[1])


    musician = Artist.find_or_create_by_name(song_text[0])
    new_song.artist = musician

    musician.add_song(new_song)
    new_song
  end

end
