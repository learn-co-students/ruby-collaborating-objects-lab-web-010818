require 'pry'

class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
    # @files = []
  end

  def files
    # binding.pry
    @files ||= Dir["#{@path}/*.mp3"].map do |file|
      split_file_path = file.split("/")
      # @files << split_file_path[split_file_path.size - 1]
      split_file_path[split_file_path.size - 1]
    end
  end

  def import
    filenames = self.files
    # binding.pry
    filenames.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end
