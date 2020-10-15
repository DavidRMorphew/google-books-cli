class API
    def self.fetch_free_books
        url = "https://www.googleapis.com/books/v1/volumes?q=filter=free-ebooks&Pagination=maxResults&printType=books"
        
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        binding.pry
        array_of_books = hash["items"]
    end
end