require_relative 'teacher'
require_relative 'student'
require_relative 'storage'

class PeopleManager
  attr_reader :people

  def initialize
    @people = Storage.load_data('people')
  end

  def add_person(person)
    if person_already_exists?(person)
      puts 'Person already exists.'
    else
      @people << person
      Storage.save_data('people', people)
      puts 'Person added successfully.'
    end
  end

  def list_all_people
    @people.each_with_index do |person, index|
      if person.is_a?(Teacher)
        puts "#{index + 1}) [#{person.class}] Name: #{person.name}, Age: #{person.age}"
      else
        puts "#{index + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  private

  def person_already_exists?(person)
    @people.any? { |p| p.id == person.id }
  end
end
