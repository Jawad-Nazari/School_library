require_relative 'student'
require_relative 'person'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'book_manager'
require_relative 'people_manager'
require_relative 'rental_manager'

class BookInterface
  def add_book(title, author)
    raise NotImplementedError, 'Subclasses must implement this method'
  end

  def list_all_books
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end

class BookManagerAdapter < BookInterface
  def initialize(book_manager)
    super()
    @book_manager = book_manager
  end

  def add_book(title, author)
    @book_manager.add_book(title, author)
  end

  def list_all_books
    @book_manager.list_all_books
  end
end

class App
  def initialize(parent)
    @parent = parent
    @books_list = []
    @people_list = PeopleManager.new
    @rentals_list = RentalManager.new
  end

  def list_all_books
    if @books_list.empty?
      puts 'There are no available records! Please add some books first.'
    else
      puts 'All available books in the library are as below:'
      @books_list.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    @parent.show_menu
  end

  def list_all_people
    @people_list.list_all_people
    @parent.show_menu
  end

  def create_person
    puts 'Do you want to create a Student(1) or a Teacher(2)? [Enter the number]'
    person_role = @parent.request_input
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
    name = @parent.request_input
    print 'Enter student age: '
    age = @parent.request_input.to_i
    print 'Enter student classroom: '
    classroom = @parent.request_input.to_i
    print 'Allowed by parents? [Yes/No]: '
    parent_permission_input = @parent.request_input.downcase
    parent_permission = parent_permission_input == 'yes'
    student = Student.new(name, age, classroom, parent_permission: parent_permission)
    @people_list.add_person(student)
    puts 'Student successfully registered'
  end

  def create_teacher
    print 'Enter Teacher Name: '
    name = @parent.request_input
    print 'Enter Teacher Age: '
    age = @parent.request_input
    print 'Enter Teacher Specialization: '
    specialization = @parent.request_input
    teacher = Teacher.new(age, specialization, name)
    @people_list.add_person(teacher)
    puts 'Person created successfully'
  end

  def create_book
    print 'Enter a book name: '
    title = @parent.request_input
    print 'Enter the author name: '
    author = @parent.request_input
    book = Book.new(title, author)
    @books_list << book
    puts 'Book created successfully'
    @parent.show_menu
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books_list.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
    selected_book = @parent.request_input.to_i
    puts
    puts 'Select a person from the following list by number (not id)'
    @people_list.instance_variable_get(:@people).each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    selected_person = @parent.request_input.to_i
    print 'Date: '
    date = @parent.request_input
    rental = Rental.new(date, @books_list[selected_book],
                        @people_list.instance_variable_get(:@people)[selected_person])
    @rentals_list.add_rental(rental)
    puts 'Rental created successfully'
    @parent.show_menu
  end

  def list_all_rentals
    print 'ID of person: '
    person_id = @parent.request_input.to_i
    puts 'Rentals:'
    @rentals_list.list_all_rentals(person_id)
    @parent.show_menu
  end

  def exit
    puts 'Thank you for using this application!'
  end
end
