class CLI
    def start
        puts "Welcome!"
        API.fetch_free_books
        # binding.pry
        self.book_list_by_title
    end

    def book_list_by_title
        # give user the option to see a book list by title
        # list out the books by their titles and subtitles, if there are subtitles
        puts "Would you like to see a list of books by title?"
        puts "Type 'yes' to see the book list or any other key to exit."
        
        user_input = gets.strip.downcase
        # if the user says yes, provide a book list by titles
        if user_input == "yes" || user_input == "y"
            puts "Enjoy browsing by title!"
            # display the book list by titles
            self.display_books_by_title
        end
    end

    def display_books_by_title
        Book.all.each.with_index(1) do |book, index|    
            puts "(#{index}.) #{book.title}" 
        end
    end
end