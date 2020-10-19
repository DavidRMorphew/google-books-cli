class CLI

    def start
        puts "Welcome"
        API.fetch_free_books
        Book.only_with_free_pdf
    end
end