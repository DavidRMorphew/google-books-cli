class Book
    attr_accessor :authors, :title, :subtitle, :description, :publication_date, :links, :categories, :isbn_nums, :languages
    @@all = []
    def initialize(assignment_hash)
        assignment_hash.each {|key, value| self.send(("#{key}="), value) if value && value != []}
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_language(language)
    end
end