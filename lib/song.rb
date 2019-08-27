class Song

  attr_accessor :name
  @@all = [] #class variable is for the whole class; saves all instances of song so you can have a collection of song instances
  
  def initialize(title)
    @name = title
    
  end

  def self.all #class method; function to accesss all instances of the call AKA CLASS READER METHOD
    @@all
  end
  
  def self.destroy_all
  @@all.clear #all.clear would work too
  end
  
  def save
    self.class.all << self #self is an instance; class method calls the class of the instance  #@@all << self #auto save
  end

  def self.create(title)
    song = Song.new(title)
    song.save #returns an array of sonsg, NOT an instance 
    song #think RETURN VALUE; always want to return an instance of a song
  end
end

#you can't ever access a class variable in an instance method cause it's out of scope; instance variable is scoped to an instance; 