class Artist

  attr_accessor :name, 
  attr_reader :songs #preferential to do reader here so it can't be changed; name of song shouldn't change
  
  @@all = [] 
  
  def initialize(title)
    @name = title
    @songs = []
  end

  def self.all 
    @@all
  end
  
  def self.destroy_all
  @@all.clear 
  end
  
  def save
    self.class.all << self
  end

  def self.create(title)
    artist = self.new(title)
    artist.save 
    artist
  end
end