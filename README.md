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
## Starting the Program

Once installed, you can load the program from your terminal by using the following commands:
```bash
cd google_books_cli
ruby bin/run
```

## Usage

Once started, this program greets the user and asks if they would like to see a list of books by title.

```
Welcome to 'Object-Oriented Programming' books on Google Books!

Would you like to see a list of books by title?
 Type 'yes' to see the book list or any other key to exit.
```

— If the user enters "yes" or "y", a numbered list of 40 titles appears. 

```
Enjoy browsing by title!

-------
(1) Object-Oriented Programming Languages: Interpretation
(2) Object-Oriented Programming in C++
(3) OBJECT ORIENTED PROGRAMMING WITH JAVA
...
(40) The Object-Oriented Thought Process
-------
```
— Any other key exits the program with a goodbye message.

```
Goodbye! Feel free to come back!
```
If the user has chosen to browse the list of titles, they are prompted to choose a book for more details:

```
Please enter a number between 1 and 40 for more information on a book.
 Or type 'exit' to exit.
```

— If the user enters a valid number between 1 and 40, without any non-digit characters, then the selected book's details will be displayed:

```
=======

 Title: OBJECT ORIENTED PROGRAMMING WITH JAVA

 Authors: M. T. Somashekara, D. S. Guru, K. S. Manjunatha

 Date of Publication: 2017-06-01

 ... 

 ISBN Identification: ISBN 13: 9788120352872, ISBN 10: 8120352874

 Clickable Links: EPUB link: http://books.google.com/books/download/OBJECT_ORIENTED_PROGRAMMING_WITH_JAVA-sample-epub.acsm?id=A8wnDwAAQBAJ&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api, PDF link: http://books.google.com/books/download/OBJECT_ORIENTED_PROGRAMMING_WITH_JAVA-sample-pdf.acsm?id=A8wnDwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api

=======
```
— If the user enters "exit", they are given a goodby message:

```
Goodbye! Feel free to come back!
```

— Any other user input will lead the program to repeat the prompt:

```
Please enter a number between 1 and 40 for more information on a book.
 Or type 'exit' to exit.
 ```

After seeing further details on a book, the user is then asked if they would like to see the book list again, which repeats the process of allowing the user to see the book list and select a book for more details:

```
Would you like to see the list of books by titles again?
 Type 'yes' to see the book list or any other key to exit.
 ```
The user may repeat this process as long as they would like.

## Customizing Word-Wrap Output

For certain portions of the output, such as the book description, the output of wrapped text is customizable by line width and you may want to change the word-wrap width if your terminal size and text size output broken lines of text where wrapped. 

In CLI.rb, you can adjust the width by passing in a larger or smaller integer as the width_argument to the `.fit(width_argument)` method (in l. 64 and l. 76), which are currently set at a width of '80':

```bash
puts " Description: \n".green + "#{book.description}".fit(80).light_green if book.description
```
For more on the word-wrap `.fit` method, see https://github.com/pazdera/word_wrap.