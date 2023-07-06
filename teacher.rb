class Teacher
  attr_reader :name, :age, :specialization

  def initialize(name, age, specialization)
    @name = name
    @age = age
    @specialization = specialization
  end

  def to_json(*args)
    {
      'json_class' => self.class.name,
      'data' => {
        'name' => @name,
        'age' => @age,
        'specialization' => @specialization
      }
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['data']['name'], object['data']['age'], object['data']['specialization'])
  end

  def inspect
    @name
  end
end
