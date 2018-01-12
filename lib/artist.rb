class Artist
  @@all=[]
  attr_accessor :name,:songs
  def initialize(name)
    @name=name
    @songs=[]
  end

  def add_song(song)
    @songs<<song
    song.artist=self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if @@all.map {|a| a.name}.include?(name)
      @@all.find {|a| a.name==name}
    else
      artist=Artist.new(name)
    end
  end

  def save
    @@all<<self
  end

  def print_songs
    songs.each do |s|
      puts s.name
    end
  end









end
