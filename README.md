# Fetching and Displaying "Object-Oriented Programming" Books in Google Books

Fetching data from the Google Books API, this Ruby CLI Program lets you browse the titles of the top 40 search results for books on Object-Oriented Computer Programming.

You, as the user, can then select a book to get more information such as author(s), subtitle, publication date, ISBN numbers (which you can use to find the book), and links that you can click to access a digital sample or full-text copy of the book.

## Installation 

To install the program, open Terminal and run the following command:

```bash
git clone git@github.com:DavidRMorphew/google-books-cli.git
```
For the customized output to work, you will also want to install the colorize and the word-wrap gems:
```bash
gem install colorize
gem install word_wrap
```
## Starting and Using the Program

Once installed, you can load the program from your terminal by using the following commands:
```bash
cd google_books_cli
ruby bin/run
```

## Customizing Word-Wrap Output

For certain portions of the output, such as the book description, the output of wrapped text is customizable by line width and you may want to change the word-wrap width if your terminal size and text size output broken lines of text where wrapped. 

In CLI.rb, you can adjust the width by passing in a larger or smaller integer as the width_argument to the #fit method (in l. 64 and l. 76), which are currently set at a width of '80':

```bash
puts " Description: \n".green + "#{book.description}".fit(80).light_green if book.description
```
For more on the word-wrap #fit method, see https://github.com/pazdera/word_wrap.




