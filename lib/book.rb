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

    def self.find_by_language(language)
        Book.all.select {|book| book.languages.include?(language) if book.languages}
    end

    def self.only_on_computers
        Book.all.select do |book| 
            book.categories.any? {|category| category.match?(/Computer/)} if book.categories
        end
    end
end