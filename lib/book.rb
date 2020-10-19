class Book
    attr_accessor :title, :subtitle, :author, :pdf_link, :epub_link, :publication_date, :description, :categories, :isbn_nums
    @@all = []
    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.only_with_free_pdf
        puts "This class method for only_with_free_pdf is being called."
        binding.pry
        self.all.select {|book| book.pdf_link || book.epub_link}
    end
end