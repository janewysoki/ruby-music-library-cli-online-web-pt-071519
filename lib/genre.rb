class Genre
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def add_song(song)
        song.genre = self unless song.genre
        @songs << song unless @songs.include?(song)
    end

    def artists
        songs.collect do |song| #or all three lines could be: songs.collect {|song| song.artist}.uniq
            song.artist
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
        #name = Genre.new(name)
        #name.save
        #name

    end
end


#class Artist
    #has_many :songs
    #has_many :genres, through :songs
#end

#class Song
    #belongs_to :artist
    #belongs_to :genre
#end

#class Genre
    #has_many :songs
    #has many :artists, through :songs
#end