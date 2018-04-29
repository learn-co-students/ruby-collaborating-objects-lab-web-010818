class Song
  attr_accessor :name, :artist

  @@songs = []

  def initialize(name)
    @name = name
    @@songs << self
  end

  def self.all
    @@songs
  end

  def self.find_or_create_by_name(name)
    song = Song.all.find{|song| song.name == name}
    if song
      song
    else
      song = Song.new(name)
    end
  end

  def self.new_by_filename(file_name)
    details = file_name.split(" - ")
    artist_name = details[0]
    genre_name = details[2].gsub(".mp3", "")
    song_name = details[1]

    song = Song.find_or_create_by_name(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(song)

    song
  end



end
