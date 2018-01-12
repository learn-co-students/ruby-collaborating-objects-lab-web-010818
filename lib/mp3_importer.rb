class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path  = path
  end

  def files
    Dir[(self.path + '/*.mp3')].collect { |f| File.basename f }
  end

  def import
    files.each do |file_name|
      Song.new_by_filename(file_name)
    end
  end

end

# './db/mp3s/*.mp3'
