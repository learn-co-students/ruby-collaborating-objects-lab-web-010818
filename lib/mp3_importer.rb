class MP3Importer
  attr_accessor :path
  attr_reader :files

  def initialize(path)
    @path = path
  end

  def files
    file_array = Dir.entries(self.path)
    file_array.select do |file|
      file.end_with?('.mp3')
    end
  end

  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end


end
