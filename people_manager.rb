require_relative 'person'

class PeopleManager
  def initialize
    @people = []
  end

  def add_person(person)
    @people << person
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
end
