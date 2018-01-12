class Artist

  attr_accessor :name, :songs, :all

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def name=(name)
    @name = name
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(musician)
    artist = self.all.select {|artist| artist.name == musician}
    artist.length > 0 ? artist[0] : Artist.new(musician)
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end


end
