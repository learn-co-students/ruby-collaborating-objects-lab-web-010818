require 'pry'
require_relative 'song.rb'
require_relative 'artist.rb'

class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
  files = Dir.entries("#{path}").select {|f| !File.directory? f}
  end

  def import
    files.each do |filename|
      Song.new_by_filename(filename)
    end

  end

end
# Pry.start
#
