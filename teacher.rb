require './person'

# Teacher class
class Teacher < Person
  def initialize(specialization)
    super()
    @specialization = specialization
  end
  can_use_services? == true
end
