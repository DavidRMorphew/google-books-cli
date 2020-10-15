class CLI

    def start
        puts "Welcome"
        API.fetch_free_books
    end
end