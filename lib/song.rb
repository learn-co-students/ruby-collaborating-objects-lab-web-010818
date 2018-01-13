
class Song
 attr_accessor :name, :artist

 def initialize(name)
   @name = name
   @artist = artist
 end

 def artist_name(name)
   self.artist = Artist.find_or_create_by_name(name)
   @artist.add_song(self)
 end


 def self.new_by_filename(file)
   song_name = file.split(" - ")[1]
   artist_name = file.split(" - ")[0]
   song = Song.new(song_name)
   artist = song.artist_name(artist_name)
   artist.save if Artist.all.include?(artist) == false
   song
 end




end
