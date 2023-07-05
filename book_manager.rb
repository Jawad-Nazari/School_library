require 'json'
require_relative 'book'

class BookManager
  attr_accessor :books

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

  def save_books_to_file
    file_path = 'db/books.json'
    File.write(file_path, JSON.generate(@books))
  end

  def load_books_from_file
    file_path = 'db/books.json'
    if File.exist?(file_path)
      json_data = File.read(file_path)
      @books = JSON.parse(json_data)
    else
      @books = []
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def list_all_books_with_count
    if @books.empty?
      puts 'No record found! Add some books...'
    else
      puts "Available books in the library: #{books.count}"
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end
end
