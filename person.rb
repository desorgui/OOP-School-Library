require './nameable'
require './rental'

# implementation person class
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

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

  def add_rentals(rental)
    @rentals.push(rental)
    rental.person = self
  end
end
