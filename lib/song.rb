require 'pry'

class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.create(name, artist)
    song = Song.new(name)
    song.artist = artist
    @@all << song
    artist.add_song(name)
    song
  end

  def self.new_by_filename(filename)
    split_filename ||= filename.split("-")
    artist = Artist.find_or_create_by_name(split_filename[0].strip)
    song_name = split_filename[1].strip
    song  = self.create(song_name, artist)
    song
    # binding.pry
  end



end
