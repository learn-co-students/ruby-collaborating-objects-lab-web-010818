require "pry"
class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(self.path).select do |song_file|
      song_file.include?(".mp3")
    end
  end

  def import
    files.map do |file|
      Song.new_by_filename(file)
    end
  end

end
