class CLI
    @ask_count = 0

    def start
        puts "\nWelcome!"
        API.fetch_free_books
        # binding.pry
        self.book_list_by_title
    end

    def book_list_by_title
        # give user the option to see a book list by title
        # list out the books by their titles and subtitles, if there are subtitles
        puts "\nWould you like to see a list of books by title?"
        puts " Type 'yes' to see the book list or any other key to exit."
        
        user_input = gets.strip.downcase
        # if the user says yes, provide a book list by titles
        if user_input == "yes" || user_input == "y"
            puts "\nEnjoy browsing by title!\n\n"
            sleep(1)
            # display the book list by titles
            # self.display_books_by_title
            self.display_books_by_title
            self.ask_user_for_book_choice
        end
    end

    def display_books_by_title
        Book.all.each.with_index(1) do |book, index|    
            puts "(#{index}) #{book.title}"
        end
    end

    # ask about this
    # def display_books_by_attribute(attribute)
    #     Book.all.each.with_index(1) do |book, index|    
    #         puts "(#{index}) " + book.send("#{attribute}")
    #     end
    # end

    def ask_user_for_book_choice
        if @ask_count == 0
            puts "\nEnter the number of a book for more information."
            puts "   To exit, type 'exit'."
            @ask_count += 1
        end
        
        user_input = gets.strip
        index = user_input.to_i - 1

        if index.between?(0,Book.all.length - 1)
            selected_book_instance = Book.all[index]
            display_book_details(selected_book_instance)
        elsif user_input.downcase == 'exit'
            puts "Goodbye!"
        else
            puts "Please enter a number between 1 and #{Book.all.length} for more information on a book" 
            puts "Or type 'exit' to exit."
            ask_user_for_book_choice
        end
    end

    def display_book_details(book)
        puts "Title: '#{book.title}. #{book.subtitle if book.subtitle}'"
    end
end