class Spacecraft
  attr_reader :name, :fuel
  def initialize(spaceship_info)
    @name = spaceship_info[:name]
    @fuel = spaceship_info[:fuel]
  end
end
