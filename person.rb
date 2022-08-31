require './nameable'
require './rental'

# implementation person class
class Person < Nameable
  attr_reader :rentals

  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # Getter for id
  attr_reader :id
  # Getters/setters for name and age
  attr_accessor :name
  attr_accessor :age

  private

  def of_age?
    @age >= 18
  end

  def can_use_services?
    true if @age >= 18 || parent_permission == true
  end

  def correct_name
    @name
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
