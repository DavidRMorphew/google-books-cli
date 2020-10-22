class CLI

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
            puts " Type 'yes' to see the book list or any other key to exit.\n".light_red
            @first_ask = "no"
        else
            puts "\nWould you like to see the list of books by titles again?".light_red
            puts " Type 'yes' to see the book list or any other key to exit.\n".light_red
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
            puts "(#{index}) ".cyan + "#{book.title}".light_green
        end
    end

    def ask_user_for_book_choice
        puts "\nPlease enter a number between 1 and #{Book.all.length} for more information on a book.".light_red 
        puts " Or type 'exit' to exit.\n".light_red
        
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
            puts "\n Title: ".magenta + "#{book.title}: #{book.subtitle}".light_magenta
        else
            puts "\n Title: ".magenta + "#{book.title}".light_magenta
        end

        if book.authors.count == 1 
            puts " Author: ".light_red + "#{book.authors.first}".light_red
        else
            puts " Authors: ".light_red + "#{book.authors.join(", ")}".light_red
        end
        
        puts " Date of (Online) Publication: ".blue + "#{book.publication_date}".light_blue if book.publication_date
        puts " Description: ".green + "#{book.description}".light_green if book.description
        puts " Some Common Languages Covered: ".red + "#{book.languages.join(", ")}".light_red if book.languages
        puts " ISBN Identification: ".yellow + "#{book.isbn_nums.join(", ")}".light_yellow if book.isbn_nums
        puts " Links: ".cyan + "#{book.links.join(", ")}".light_cyan if book.links
        
        sleep(3)
    end

    def exit_program
        puts "\nGoodbye! Feel free to come back!\n".light_blue
        @full_exit = "yes"
    end
end