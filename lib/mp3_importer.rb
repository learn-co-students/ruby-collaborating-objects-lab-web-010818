require "pry"

class MP3Importer

  attr_accessor :path

  def initialize(filepath)
    @path = filepath
  end

  def files
    files = Dir.entries(self.path)
    files.shift(2)
    files
  end

  def import
    self.files.each do |track|
      song = Song.new_by_filename(track)
      end
    end

end
