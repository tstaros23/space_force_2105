class Flotilla
  attr_reader :designation
  def initialize(ship_info)
    @designation = ship_info[:designation]
  end
end
