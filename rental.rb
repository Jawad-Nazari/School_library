require_relative 'book'
require_relative 'person'

class Rental
  attr_reader :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def to_json(*args)
    {
      'json_class' => self.class.name,
      'data' => {
        'date' => @date,
        'book' => @book,
        'person' => @person
      }
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['date'], object['book'], object['person'])
  end
end
