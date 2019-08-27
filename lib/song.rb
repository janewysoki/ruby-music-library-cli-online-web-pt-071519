class Song

  attr_accessor :name
  @@all = [] #class variable is for the whole class; saves all instances of song so you can have a collection of song instances
  
  def initialize(title)
    @name = title
    @@all << self #auto save
  end

  def self.all #class method; function to accesss all instances of the call AKA CLASS READER METHOD
    @@all
  end
  
end

#you can't ever access a class variable in an instance method cause it's out of scope; instance variable is scoped to an instance; 