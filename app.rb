require 'student'
require 'teacher'
require 'book'
require 'rental'

class App
  def initialize(parent)
    @parent = parent
    @books_list = []
    @people_list = []
    @rentals_list = []
  end

  def list_all_books
    if @books_list.empty?
      puts 'There is no any available record! Please, add some books first'
    else
      puts 'All available books in the library are as below'
      @books_list.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    @parent.show_menu
  end
end
