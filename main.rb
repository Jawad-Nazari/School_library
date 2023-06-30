require_relative 'app'

class Options
  def initialize
    @app = App.new(self)
    puts 'Welcome to the School Library application!'
    show_menu
  end

  def show_menu
    puts
    puts 'Please select of the below options by entering its number:'
    puts '1 -  List all Books'
    puts '2 -  List all People'
    puts '3 -  Create a Person'
    puts '4 -  Create a Book'
    puts '5 -  Create a Rental'
    puts '6 -  List all Rentals for a given person id'
    puts '7 -  Exit'
    user_choice = gets.chomp
    select_option(user_choice)
  end

  def select_option(user_choice)
    options = {
      '1' => :list_all_books,
      '2' => :list_all_people,
      '3' => :create_person,
      '4' => :create_book,
      '5' => :create_rental,
      '6' => :list_all_rentals,
      '7' => :exit
    }

    method = options[user_choice]
    if method.nil?
      puts 'Invalid option selected, please select a number from the list!'
      show_menu
    else
      @app.send(method)
    end
  end
end

def main
  Options.new
end

main
