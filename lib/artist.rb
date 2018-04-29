require 'pry'

class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def add_song(song)
    song.artist = self
  end

  def songs
    Song.all.select {|song| self === song.artist}
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def print_songs
    song_names = self.songs.map{|song| song.name}
    puts song_names.join("\n")
  end



  def self.find_or_create_by_name(name)
    artist = Artist.all.find{|artist| artist.name == name}

    if artist
      artist
    else
      Artist.create(name)
    end
  end

end
