class BookManager
  def initialize
    @books = []
  end

  def add_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def list_all_books
    if @books.empty?
      puts 'There are no available records! Please add some books first.'
    else
      puts 'All available books in the library are as below:'
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end
end
