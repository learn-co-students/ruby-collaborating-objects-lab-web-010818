class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if self.all.map { |a| a.name }.include?(name)
      self.all.find { |b| b.name == name }
    else
      Artist.new(name)
    end
  end

  def add_song(song)
    songs << song
  end

  def save
    self.class.all << self
  end

  def print_songs
    self.songs.each { |s| puts s.name }
  end

end
