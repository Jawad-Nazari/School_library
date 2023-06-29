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
end
