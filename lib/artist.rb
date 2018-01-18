require "pry"

class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []

  end


  def add_song(song)
    self.songs << song
    # song.artist = self
  end

  def songs
    @songs
  end


  def save
  @@all << self
  end


  def self.all
    @@all
  end

  def self.find_or_create_by_name(artist_name)
    if !(self.all.find {|obj| obj.name == artist_name})
      self.new(artist_name)

    else
      (self.all.find {|obj| obj.name == artist_name})
    end
    end

    def print_songs
      @songs.each do |song|
        puts song.name
      end


      end




end
