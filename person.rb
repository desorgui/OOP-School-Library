# implementation person class
class Person
  def initialize(age, _parent_permission: true, name: 'Unknown')
    @id = id
    @name = name
    @age = age
  end

  # Getter for id
  attr_reader :id
  # Getters/setters for name and age
  attr_accessor :name
  attr_accessor :age

  def of_age?
    @age >= 18
  end

  private

  def can_use_services?
    true if @age >= 18 || parent_permission == true
  end
end
