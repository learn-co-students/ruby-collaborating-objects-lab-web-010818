class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def self.all
    @@all
  end

  def add_song(song_object)
    @songs << song_object
    song_object.artist = self
  end

  def self.find_or_create_by_name(name)
    found_artist = @@all.find do |artist|
      artist.name == name
    end
    found_artist ||= self.create(name)
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end




end
