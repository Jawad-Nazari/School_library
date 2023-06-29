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
end

def main
  Options.new
end


main
