class Artist
    extend Concerns::Findable #extend means we want class methods to be added to our class
    attr_accessor :name
    attr_reader :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def add_song(song)
        song.artist = self unless song.artist
        @songs << song unless @songs.include?(song)
    end

    def genres
        songs.collect do |song| #or all three lines could be: songs.collect {|song| song.genre}.uniq
            song.genre
        end.uniq
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        @@all << self
        self #this makes save return the song you save so when you use save in the create method it automatically gets returned
    end

    def self.create(name)
        new(name).save    
        #name = Artist.new(name)
        #name.save
        #name

    end
end