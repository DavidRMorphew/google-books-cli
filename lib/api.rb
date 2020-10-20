require 'pry'

class API
    PROGRAMMING_LANGUAGES = ["Java", "C++", "C#", "Python", "JavaScript", "Ruby", "Eiffel"]

    def self.fetch_free_books
        url = "https://www.googleapis.com/books/v1/volumes?q=object+oriented+computer+programming&download=epub&filter=free-ebooks&filter=full&printType=books&maxResults=40&key=#{ENV["GBOOKS_API_KEY"]}"
       
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_books = hash["items"]
        
        array_of_books.each do |book_hash|   
            assignment_hash = {}
            assignment_hash[:authors] = book_hash["volumeInfo"]["authors"].map do |name| 
                name.split(" ").map do |name_part| 
                    if name_part.length == 1
                        (name_part += ".").capitalize
                    else
                        name_part.capitalize
                    end
                end.join(" ")
            end
            assignment_hash[:title] = book_hash["volumeInfo"]["title"]
            assignment_hash[:subtitle] = book_hash["volumeInfo"]["subtitle"] if book_hash["volumeInfo"]["subtitle"]
            assignment_hash[:description] = book_hash["volumeInfo"]["description"]
            assignment_hash[:publication_date] = book_hash["volumeInfo"]["publishedDate"]
                      
            if book_hash["accessInfo"]["pdf"]["acsTokenLink"]
                assignment_hash[:pdf_link] = "PDF link: "+book_hash["accessInfo"]["pdf"]["acsTokenLink"]
            end

            if book_hash["accessInfo"]["epub"]["acsTokenLink"]
                assignment_hash[:epub_link] = "Epub link: "+book_hash["accessInfo"]["epub"]["acsTokenLink"]
            end
            
            if book_hash["volumeInfo"]["industryIdentifiers"]
                isbn_values = book_hash["volumeInfo"]["industryIdentifiers"].collect do |isbn_hash|
                        "#{isbn_hash["type"].gsub("_"," ")}: #{isbn_hash["identifier"]}"
                    end
                else
                    isbn_values = nil
                end
            assignment_hash[:isbn_nums] = isbn_values

            # assignment_hash[:languages] = languages
            # languages = PROGRAMMING_LANGUAGES.select do |language|
            #     binding.pry
            #     assignment_hash[:title].match?(/language\b/) || (assignment_hash[:subtitle].match?(/language\b/) if assignment_hash[:subtitle]) || (assignment_hash[:description].match?(/language\b/) if assignment_hash[:description])
            #     end
                
            book = Book.new(assignment_hash)
        end
    end
end
