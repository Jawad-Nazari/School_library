require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(name, age, classroom, parent_permission: true)
    super(age, parent_permission: parent_permission)
    @name = name
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*args)
    {
      'json_class' => self.class.name,
      'data' => {
        'name' => @name,
        'age' => @age,
        'classroom' => @classroom
      }
    }.to_json(*args)
  end

  def self.json_create(data)
    new(data['data']['name'], data['data']['age'], data['data']['classroom'])
  end
end
