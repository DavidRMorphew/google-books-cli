# Fetching and Displaying "Object-Oriented Programming" Books from Google Books

This Ruby CLI Program lets you, the user, browse the titles of the top 40 search results for books on Object-Oriented Computer Programming.

You can select a book to get more information, such as author(s), subtitle, publication date, ISBN numbers, and links to digital editions of the book.

## Installation 

To install the program, open your Terminal and run the following command:

```bash
git clone git@github.com:DavidRMorphew/google-books-cli.git
```
For the customized output to work, you will also want to install the `colorize` and the `word-wrap` gems:
```bash
gem install colorize
gem install word_wrap
```

The program is set up to use an API key, but currently you can use the program without one.
* If you want to use an API key, you will need to [generate one](https://cloud.google.com/docs/authentication/api-keys) with Google Books, and you can include that key in a `.env` file as explained [here](https://medium.com/@daniaherrera/how-to-use-dotenv-ruby-gem-to-secure-your-api-keys-92382aab888a). 
* If you don't want to use one, remove `&key=#{ENV["GBOOKS_API_KEY"]}` from the end of the url in l. 7 of the `API.rb` file and delete l. 5 (`require 'dotenv/load'`) in the `environment.rb` file.
## Starting the Program

Once installed, you can load the program from your terminal by using the following commands:
```bash
cd google_books_cli
ruby bin/run
```

## Usage

After starting, this program greets the user and asks if they would like to see a list of books by title.

If the user chooses to browse the list of titles, a list of numbered titles (1–40) is displayed, and the user is prompted to choose a book to see more details.

Entering a valid number between 1 and 40, without any non-digit characters, will display the details of the selected book.

After the details are displayed, the user is asked if they would like to see the book list again, and the entire process repeats—until the user chooses to exit the program.

## Contributing

Pull requests are welcome. If you want to make major changes, please open an issue first to discuss the proposed change.

## Future Functionality

This CLI has room for expansion in at least two areas **(i)** book-listing by different attributes and **(ii)** formatting titles and subtitles to be more standardized. For some ideas on expansion in these areas, see "Future Functionality" in my [blog post](https://davidrmorphew.medium.com/booking-my-first-coding-project-fba0da20808e). Feel free to leave a comment there too.

## License
[MIT](https://github.com/DavidRMorphew/google-books-cli/blob/main/LICENSE.txt)