class CLI

    def start
        puts "Welcome"
        API.fetch_free_books
        Book.on_java
    end
end