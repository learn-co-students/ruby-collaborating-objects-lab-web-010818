require_relative './song'

class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def add_song(song)
    songs << song
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new_artist = Artist.new(name)
    @songs = []
    self.all << new_artist
    new_artist
  end

  def self.find_or_create_by_name(name)
    artist = self.all.select { |artist| artist.name == name }
    if artist.empty?
      self.create(name)
    else
      artist[0]
    end
  end

  def print_songs
    songs.each { |song| puts song.name }
  end
end
