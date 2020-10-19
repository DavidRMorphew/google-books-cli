# require 'dotenv/load'
class API
    def self.fetch_free_books
        url = "https://www.googleapis.com/books/v1/volumes?q=object+oriented+computer+programming&download=epub&filter=free-ebooks&filter=full&printType=books&maxResults=40&key=#{ENV["GBOOKS_API_KEY"]}"
       
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_books = hash["items"]
        array_of_books.each do |book_hash|
            assignment_hash = Hash.new
            assignment_hash["authors"] = book_hash["volumeInfo"]["authors"]
            assignment_hash["title"] = book_hash["volumeInfo"]["title"]
            assignment_hash["subtitle"] = book_hash["volumeInfo"]["subtitle"]
            assignment_hash["description"] = book_hash["volumeInfo"]["description"]
            assignment_hash["publication_date"] = book_hash["volumeInfo"]["publishedDate"]
            assignment_hash["link"] = book_hash["accessInfo"]["pdf"]["acsTokenLink"]+"\n"+book_hash["accessInfo"]["epub"]["acsTokenLink"]
            binding.pry
            
            assignment_hash["isbn_nums"] = book_hash["volumeInfo"]["industryIdentifiers"].collect_and_parse_isbn_nums
            
            # if book_hash["volumeInfo"]["industryIdentifiers"] 
            #     isbn_nums = book_hash["volumeInfo"]["industryIdentifiers"].collect do |isbn_hash|
            #         replace_underscore(isbn_hash["type"])+": #{isbn_hash["identifier"]}"
            #         end
            # else
            #     isbn_nums = nil
            # end

            book = Book.new(assignment_hash)
            
            
             
            # new hash for mass assignment with initialize in Book class

        end
    end
        # parse for the languages here with method to be used above
   
    def replace_underscore(value)
        "#{value}".gsub("_"," ")
    end

    def collect_and_parse_isbn_nums
        if self != []
            self.collect do |isbn_hash|
                replace_underscore(isbn_hash["type"]) + ": #{isbn_hash["identifier"]}"
            end
        else
            nil
        end
    end

end