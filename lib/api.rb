require 'pry'

class API
     def self.fetch_free_books
        url = "https://www.googleapis.com/books/v1/volumes?q=object+oriented+computer+programming&download=epub&filter=free-ebooks&filter=full&printType=books&maxResults=40&key=#{ENV["GBOOKS_API_KEY"]}"
       
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_books = hash["items"]
        array_of_books.each do |book_hash|   
            assignment_hash = {}
            assignment_hash[:authors] = book_hash["volumeInfo"]["authors"].map {|name| name.split(" ").map {|name_part| name_part.capitalize}.join(" ")}
            assignment_hash[:title] = book_hash["volumeInfo"]["title"]
            assignment_hash[:subtitle] = book_hash["volumeInfo"]["subtitle"]
            assignment_hash[:description] = book_hash["volumeInfo"]["description"]
            assignment_hash[:publication_date] = book_hash["volumeInfo"]["publishedDate"]
                
            pdf_link = book_hash["accessInfo"]["pdf"]["acsTokenLink"]
            epub_link = book_hash["accessInfo"]["epub"]["acsTokenLink"]
            
            assignment_hash[:link] = [pdf_link, epub_link]
            
            if book_hash["volumeInfo"]["industryIdentifiers"]
                isbn_values = book_hash["volumeInfo"]["industryIdentifiers"].collect do |isbn_hash|
                        "#{isbn_hash["type"].gsub("_"," ")}: #{isbn_hash["identifier"]}"
                    end
                else
                    isbn_values = nil
                end
            assignment_hash[:isbn_nums] = isbn_values

            book = Book.new(assignment_hash)
        end
    end
end
        # parse for the languages here with method to be used above
