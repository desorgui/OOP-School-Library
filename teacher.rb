require './person'

# Teacher class
class Teacher < Person
  def initialize(age, name = 'Unknown', specialization)
    super(age, name, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
