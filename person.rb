require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  @people = [] # Class instance variable to store all people

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    self.class.people << self # Add the person to the list of all people
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

  def self.find_by_id(id)
    people.find { |person| person.id == id }
  end

  def self.people
    @people ||= [] # Initialize @people if it's nil
  end

  def to_hash
    {
      'name' => @name,
      'age' => @age
    }
  end

  def self.from_hash(hash)
    age = hash['age']
    name = hash['name']
    new(age, name: name)
  end
end
