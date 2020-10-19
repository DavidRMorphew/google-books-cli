class API
    def self.fetch_free_books
        url = "https://www.googleapis.com/books/v1/volumes?q=object+oriented+computer+programming&download=epub&filter=free-ebooks&filter=full&printType=books&maxResults=40"
        
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_books = hash["items"]
        array_of_books.each do |book_hash|
            book = Book.new
            book.title = book_hash["volumeInfo"]["title"]
            book.subtitle = book_hash["volumeInfo"]["subtitle"]
            book.author = book_hash["volumeInfo"]["authors"]
            book.pdf_link = book_hash["accessInfo"]["pdf"]["acsTokenLink"]
            book.epub_link = book_hash["accessInfo"]["epub"]["acsTokenLink"]
            book.publication_date = book_hash["volumeInfo"]["publishedDate"]
            book.description = book_hash["volumeInfo"]["description"]
            book.categories = book_hash["volumeInfo"]["categories"]

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
    
    end
end