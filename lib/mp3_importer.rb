# require "pry"




  class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files   #returns an array of files e.g. "Jamie xx - Far Nearer - rock.mp3"
    Dir["#{path}/*.mp3"].map do |file|
      File.basename file

    end
  end





  def import


    files.each do |file|
    Song.new_by_filename(file)



    end
  end
end
