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

    def list_all_people
    if @people_list.empty?
      puts 'There is no any available record! Please, add a person first'
    else
      puts 'All avilable persons in the library are as below'
      @people_list.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    @parent.show_menu
  end
end
