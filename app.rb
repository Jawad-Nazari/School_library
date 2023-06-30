require_relative 'student'
require_relative 'person'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

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
      puts 'All available persons in the library are as below'
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
    print 'Enter student name: '
    name = gets.chomp
    print 'Enter student age: '
    age = gets.chomp.to_i
    print 'Enter student classroom: '
    classroom = gets.chomp.to_i
    print 'Allowed by parents? [Yes/No]: '
    parent_permission_input = gets.chomp.downcase

    parent_permission = parent_permission_input == 'yes'

    student = Student.new(name, age, classroom, parent_permission: parent_permission)
    @people_list << student

    puts 'Student successfully registered'
  end

  def create_teacher
    print 'Enter Teacher Age: '
    age = gets.chomp
    print 'Enter Teacher Name: '
    name = gets.chomp
    print 'Enter Teacher Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people_list << teacher
    puts 'Person created successfully'
  end

  def create_book
    print 'Enter a book name: '
    title = gets.chomp
    print 'Enter the author name: '
    author = gets.chomp
    book = Book.new(title, author)
    @books_list << book
    puts 'Book created successfully'
    @parent.show_menu
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books_list.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
    selected_book = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not id)'
    @people_list.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    selected_person = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    @rentals_list.push(Rental.new(date, @books_list[selected_book], @people_list[selected_person]))
    puts 'Rental created successfully'
    @parent.show_menu
  end

  def list_all_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals_list.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
    @parent.show_menu
  end

  def exit
    puts 'Thank you for using this application!'
  end
end
