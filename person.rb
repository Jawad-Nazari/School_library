require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  @people = [] 

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    self.class.people << self 
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
    @people ||= [] 
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
