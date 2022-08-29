# implementation person class
class Person
  def initialize(age, _parent_permission: true, name: 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = _parent_permission
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
end
