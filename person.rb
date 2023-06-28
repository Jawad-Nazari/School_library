require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rental
  attr_reader :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def print_of_age
    puts of_age?
  end

  private

  def of_age?
    @age >= 18
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end

person1 = Person.new(22, name: 'Jawad')
person1.print_of_age
