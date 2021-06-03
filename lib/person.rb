class Person
  attr_reader :name, :experience, :specialities
  def initialize(name, experience)
    @name = name
    @experience = experience
    @specialities = []
  end

  def add_specialty(speciality)
    @specialities << speciality
  end

end
