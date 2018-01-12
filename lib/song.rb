class Song
  @@all=[]
  attr_accessor :name,:artist

  def initialize(name)
    @name=name
    @artist=artist
  end

  def save
    @@all<<self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(path)
    file_pieces=path.split(" - ")
    artist=file_pieces[0]
    song_name=file_pieces[1]
    song=Song.new(song_name)
    artist=song.assign_artist(artist)
    artist.save if Artist.all.include?(artist)==false
    song
  end

  def assign_artist(name)
    self.artist= Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end






end
