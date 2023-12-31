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
    new(object['data']['date'], object['data']['book'], object['data']['person'])
  end
end
