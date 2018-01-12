require 'pry'

class MP3Importer
    attr_accessor :path
  def initialize(path)
    @path=path
  end

  def files
    @files=[]
    step1_files=Dir["#{path}/*.mp3"]
    step1_files.map do |f|
      step2_files=f.split("/").last
      @files<<step2_files
    end
    @files
  end

  def import
    files.each do |path|
      Song.new_by_filename(path)
    end
  end








end
