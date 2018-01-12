require 'pry'
require_relative './song'
require_relative './artist'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
    @files = Dir["#{path}/*"]
  end

  def files
    @files.map do |file|
      file.split("/").last
    end
  end

  def normalized_file_names
    files.map do |file|
      file.split(".").first
    end
  end

  def import
    normalized_file_names.each do |filename|
      new_song = Song.new_by_filename(filename)
    end
  end

end
