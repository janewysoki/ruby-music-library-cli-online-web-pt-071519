class MusicImporter

    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.entries(path).select {|path| path.match('.mp3')}
    end

    def import
        files.each {|file| Song.create_from_filename(file)}
    end
end
