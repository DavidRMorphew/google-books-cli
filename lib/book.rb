class Book
    attr_accessor :title, :subtitle, :author, :pdf_link, :publication_date, :description, :categories, :isbn_nums
    @@all = []
    def initialize
        @@all << self
    end

    def self.all
        @@all
    end
end