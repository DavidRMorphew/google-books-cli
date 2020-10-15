class API
    def self.fetch_free_books
        url = "https://www.googleapis.com/books/v1/volumes?q=programming&download=epub&filter=free-ebooks&filter=full&printType=books&maxResults=40"
        
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        binding.pry
        array_of_books = hash["items"]
        books_array_with_free_pdf = array_of_books.select {|book_hash| book_hash["accessInfo"]["pdf"]["acsTokenLink"]}
        
        # title & subtitle
        # author
        # year
        # description
        # ISBN
        # categories [=genre]
        # filter for acsTokenLink - eliminates books not in free pdf format
        # array_of_books[0]["accessInfo"]["pdf"]["acsTokenLink"]
    end
end