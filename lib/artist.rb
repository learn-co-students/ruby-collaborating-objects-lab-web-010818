class Artist

  attr_accessor :name, :songs

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
    self
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def self.find_or_create_by_name(name)

    artist = self.all.find do |artist|
      artist.name == name
    end
    artist ||= self.new(name).save

  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end

end
