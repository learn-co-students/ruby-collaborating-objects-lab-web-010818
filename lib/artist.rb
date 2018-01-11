class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
    artist
  end

  def self.find_or_create_by_name(name)
    artist = self.all.detect do |artist|
      name == artist.name
    end
    if artist
      artist
    else
      self.create(name)
    end
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end

end
