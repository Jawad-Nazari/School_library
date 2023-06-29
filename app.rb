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

  def create_person
    puts 'Do you want to create a Student(1) or a Teacher(2)? [Enter the number]'
    person_role = gets.chomp
    case person_role
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please input a valid number!'
    end
    @parent.show_menu
  end

  def create_student
    print 'Enter Student Age: '
    age = gets.chomp.to_i

    print 'Enter Student Name: '
    name = gets.chomp

    print 'Enter Student Classroom: '
    classroom = gets.chomp.to_i

    print 'Has Parent Permission? [Yes/No]: '
    parent_permission = gets.chomp.downcase

    case parent_permission
    when 'yes'
      student = Student.new(age, classroom, name, parent_permission: true)
      @people_list << student
      puts 'Student successfully registered'
    when 'no'
      student = Student.new(age, classroom, name, parent_permission: false)
      @people_list << student
      puts 'Student successfully registered'
    else
      puts 'Invalid option, please reenter'
    end
  end
end
