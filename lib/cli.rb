class CLI

    def start
        API.fetch_free_books
        binding.pry
    end
end