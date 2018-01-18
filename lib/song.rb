
require "pry"

class Song

  attr_accessor :artist, :name

  def initialize(name)
    @name = name
    @atrist = artist
  end

  def self.new_by_filename(file)


      arr = file.split("-")
    song = Song.new(arr[1].strip)
    muscian = Artist.find_or_create_by_name(arr[0].strip)
    song.artist = muscian
      muscian.songs << song
      Artist.all << muscian
    song


  end





  #
  # def self.new_by_filename(filename)
  #   artist, song = filename.split(" - ")
  #   new_song = self.new(song)
  #   new_song.artist_name = artist
  #   new_song
  # end
  #
  # def artist_name=(name)
  #   self.artist = Artist.find_or_create_by_name(name)
  #   artist.add_song(self)
  # end


end



Pry.start
