# import person class
require './person'

# Student class
class Student < Person
  attr_reader :classroom

  def initialize(classroom)
    super()
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
