class CLI
    # ask about this approach
    

    def start
        @first_ask = "yes"
        @full_exit = "no"
        puts "\nWelcome!".light_blue
        API.fetch_free_books
        self.book_list_by_title
    end

    def book_list_by_title
        if @first_ask == "yes"
            puts "\nWould you like to see a list of books by title?".light_red
            puts " Type 'yes' to see the book list or any other key to exit.".light_red
            @first_ask = "no"
        else
            puts "\nWould you like to see the list of books by titles again?"
            puts " Type 'yes' to see the book list or any other key to exit."
        end
        
        user_input = gets.strip.downcase
        if user_input == "yes" || user_input == "y"
            puts "\nEnjoy browsing by title!\n".light_yellow
            sleep(1)
           
            self.display_books_by_title
            self.ask_user_for_book_choice
            self.book_list_by_title unless @full_exit == "yes"
        else
            self.exit_program
        end
    end

    def display_books_by_title
        Book.all.each.with_index(1) do |book, index|    
            puts "(#{index}) ".light_blue + "#{book.title}".light_magenta
        end
    end

    # ask about this
    # def display_books_by_attribute(attribute)
    #     Book.all.each.with_index(1) do |book, index|    
    #         puts "(#{index}) " + book.send("#{attribute}")
    #     end
    # end

    def ask_user_for_book_choice
        puts "\nPlease enter a number between 1 and #{Book.all.length} for more information on a book." 
        puts " Or type 'exit' to exit."
        
        user_input = gets.strip
        index = user_input.to_i - 1

        if index.between?(0,Book.all.length - 1)
            selected_book_instance = Book.all[index]
            display_book_details(selected_book_instance)
        elsif user_input.downcase == 'exit'
            self.exit_program
        else
            self.ask_user_for_book_choice
        end
    end

    def display_book_details(book)
        if book.subtitle
            puts "\n Title: #{book.title}: #{book.subtitle}"
        else
            puts "\n Title: #{book.title}"
        end

        if book.authors.count == 1 
            puts " Author: #{book.authors.first}"
        else
            puts " Authors: #{book.authors.join(", ")}"
        end
        
        puts " Date of (Online) Publication: #{book.publication_date}" if book.publication_date
        puts " Description: #{book.description}" if book.description
        puts " Some Common Languages Covered: #{book.languages.join(", ")}" if book.languages
        puts " ISBN Identification: #{book.isbn_nums.join(", ")}" if book.isbn_nums
        puts " Links: #{book.links.join(", ")}" if book.links

        sleep(2)
    end

    def exit_program
        puts "\nGoodbye! Feel free to come back!\n".light_blue
        @full_exit = "yes"
    end
end