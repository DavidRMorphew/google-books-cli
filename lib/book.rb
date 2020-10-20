class Book
    attr_accessor :authors, :title, :subtitle, :description, :publication_date, :links, :isbn_nums, :languages
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

    # set language to java
    def self.find_books_on_java
        self.all.select do |book|
            book.title.match?(/Java\b/) || (book.subtitle.match?(/Java\b/) if book.subtitle) || (book.description.match?(/Java\b/) if book.description)
        end
    end
    # select books by select language covered
    # Java
    # C++, C#
    # Python
    # JavaScript
    # Ruby
    # Eiffel
    
end