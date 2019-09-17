#TYPICALLY CLASS METHODS GO AT THE TOP AND INSTANCES METHODS GO AT THE BOTTOM
require 'pry'
class Song
    extend Concerns::Findable #this wasn't in the tests but dakota said we'd probably want it here too
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize(name, artist=nil, genre=nil) #artist argument is optional and if you call it without artist then artist is equal to nil
        @name = name
        self.artist = artist #now artist= is being interpreted as a method call
        self.genre = genre
    end

    def artist=(artist)
        @artist = artist #have to assign this before we call add_song otherwise we get an error; 
        artist.add_song(self) if artist #if the artist exists then add song to it (without "if artist", artist could equal nil)
        #line above could also be written as: artist && artist.add_song(self) - here, the first artist would return nil and wouldn't go on to execute the second half of the line
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self) if genre
    end

    #def self.find_by_name(name)  #THIS IS COMMENTED OUT BC IT GOES TO FINDABLE.RB
        #self.all.find do |song| #if you see a variable thats a lower case of a class (i.e. song for Song), that's generally an instance of the class
            #song.name == name #self always refers to the method of the receiver thats being called; the receiver is always to the left of the .
        #end
   # end

    #def self.find_or_create_by_name(name)
        #self.find_by_name(name) || self.create(name) # the pipes returns the first truthy value, so if the first half is true, the second half is ignored
    #end

    def self.create(name)
        new(name).save    
        #name = Song.new(name)
        #name.save
        #name
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def self.new_from_filename(filename)
        artist, song, genre_name = filename.split(" - ")
        fixed_name = genre_name.gsub('.mp3', '')
        artist = Artist.find_or_create_by_name(artist)
        genre = Genre.find_or_create_by_name(fixed_name)
        new(song, artist, genre)
    end

    def self.create_from_filename(filename)
        new_from_filename(filename).save
    end

    def save
        @@all << self
        self #this makes save return the song you save so when you use save in the create method it automatically gets returned
    end

   
end
