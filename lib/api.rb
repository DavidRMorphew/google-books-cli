# require 'dotenv/load'
class API
    def self.fetch_free_books
        url = "https://www.googleapis.com/books/v1/volumes?q=object+oriented+computer+programming&download=epub&filter=free-ebooks&filter=full&printType=books&maxResults=40&key=#{ENV["GBOOKS_API_KEY"]}"
       
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_books = hash["items"]
        array_of_books.each do |book_hash|
            binding.pry
            assignment_hash = Hash.new
            assignment_hash["authors"] = book_hash["volumeInfo"]["authors"]
            assignment_hash["title"] = book_hash["volumeInfo"]["title"]
            assignment_hash["subtitle"] = book_hash["volumeInfo"]["subtitle"]
            assignment_hash["description"] = book_hash["volumeInfo"]["description"]
            assignment_hash["publication_date"] = book_hash["volumeInfo"]["publishedDate"]
            assignment_hash["link"] = book_hash["accessInfo"]["pdf"]["acsTokenLink"]+"\n"+book_hash["accessInfo"]["epub"]["acsTokenLink"]

            book = Book.new(assignment_hash)
            
            
             
            # new hash for mass assignment with initialize in Book class

            # it's ok to parse this here from the API
            if book_hash["volumeInfo"]["industryIdentifiers"]
                book.isbn_nums = book_hash["volumeInfo"]["industryIdentifiers"].collect do |isbn_hash| 
                    "#{isbn_hash["type"].gsub("_"," ")}: #{isbn_hash["identifier"]}"
                end
            else
                book.isbn_nums = nil
            end
        end

        # parse for the languages here with method to be used above
        # parse for isbns with a method here
    end
end