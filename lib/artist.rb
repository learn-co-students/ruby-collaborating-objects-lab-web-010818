require_relative 'song.rb'
require_relative 'mp3_importer.rb'

class Artist

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    self.all.find{|artist| artist.name == name}|| new_artists = self.new(name).tap{|artist| artist.save}
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end
end
