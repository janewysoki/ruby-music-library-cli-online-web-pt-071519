class Genre

  attr_accessor :name
  @@all = [] 
  
  def initialize(title)
    @name = title
    
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
    genre = self.new(title)
    genre.save 
    genre
  end
end