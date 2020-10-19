class Book
    attr_accessor :title, :subtitle, :author, :pdf_link, :epub_link, :publication_date, :description, :categories, :isbn_nums
    @@all = []
    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    # select books with epub or pdf link
    def self.with_link
        self.all.select {|book| book.pdf_link || book.epub_link}
    end

    def self.on_java
        self.all.select do |book|
            binding.pry
            book.title.match?(/Java\b/) || (book.subtitle.match?(/Java\b/) if book.subtitle) || (book.description.match?(/Java\b/) if book.description)
        end
    end
    # select books by select language covered
    # Java
    # C++, C#
    # Python
    # JavaScript
    # Ruby?
    # Eiffel
    
end