class Book
    attr_accessor :title, :subtitle, :author, :pdf_link, :epub_link, :publication_date, :description, :categories, :isbn_nums
    @@all = []
    def initialize
        @@all << self
        @languages = [] # this is going to be the array of languages attributes
        # set up language method for the instance that searches and assigns all of the languages that 
    end

    def self.all
        @@all
    end

    # select books with epub or pdf link
    def self.with_link
        self.all.select {|book| book.pdf_link || book.epub_link}
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