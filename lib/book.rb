class Book
    attr_accessor :authors, :title, :subtitle, :description, :publication_date, :categories, :links, :isbn_nums, :languages
    @@all = []
    
    def initialize(assignment_hash)
        assignment_hash.each {|key, value| self.send(("#{key}="), value) if value && value != []}
        @@all << self
    end

    def self.all
        @@all
    end
end