class API
    def self.fetch_free_books
        url = "https://www.googleapis.com/books/v1/volumes?q=programming&download=epub&filter=free-ebooks&filter=full&Pagination=maxResults&printType=books"
        binding.pry
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        
        array_of_books = hash["items"]

        # title
        # author
        # description
        # ISBN
        # categories [=genre]
        # filter for acsTokenLink - eliminates books not in free pdf format
    end
end