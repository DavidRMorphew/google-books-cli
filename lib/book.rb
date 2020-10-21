class Book
    attr_accessor :authors, :title, :subtitle, :description, :publication_date, :links, :isbn_nums, :languages, :categories
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

    # select books by select language covered
    # Java
    # C++, C#
    # Python
    # JavaScript
    # Ruby
    # Eiffel
    
end