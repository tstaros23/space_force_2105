require 'rspec'
require './lib/spacecraft'
require './lib/person'
require './lib/flotilla'

describe Spaceship do
  before :each do
    @daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
  end

  it 'adds requirements' do
    expect(@daedalus.requirements).to eq([])

    expect(@daedalus.add_requirement).to eq({astrophysics: 6})
    expect(@daedalus.add_requirement).to eq({quantum_mechanics: 3})

    expect(@daedalus.requirements).to eq([{astrophysics: 6}, {quantum_mechanics: 3}])
  end

describe Flotilla do
  before :each do
    @seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})
  end

  it 'exists' do
    expect(@seventh_flotilla).to be_a(Flotilla)
  end

  it 'has attributes' do
    expect(@seventh_flotilla.name).to eq('Seventh Flotilla')
  end

  it 'has no personnel or ships'
    expect(@seventh_flotilla.personnel).to eq([])
    expect(@seventh_flotilla.ships).to eq([])
  end

  it 'adds ships' do
    @seventh_flotilla.add_ship(@daedalus)

    expect(@seventh_flotilla.ships).to eq([@daedalus])
  end

  it 'adds personnel' do
    @seventh_flotilla.add_personnel(@kathy)
    @seventh_flotilla.add_personnel(@polly)
    @seventh_flotilla.add_personnel(@rover)
    @seventh_flotilla.add_personnel(@sampson)

    expect(@seventh_flotilla.personnel).to eq([@kathy, @polly, @rover])
  end

  it 'adds requirement' do
    @odyssey.add_requirement({operations: 6})
    @odyssey.add_requirement({maintenance: 3})
    expect(@seventh_flotilla.recommend_personnel(@odyssy)).to eq(@polly)


  describe Person do
    before :each do
      @kathy = Person.new('Kathy Chan', 10)
      @polly = Person.new('Polly Parker', 8)
      @rover = Person.new('Rover Henriette', 1)
      @sampson = Person.new('Sampson Edwards', 7)
    end

    it 'adds speciality'

    @kathy.add_specialty(:astrophysics)
    @kathy.add_specialty(:quantum_mechanics)
    @polly.add_specialty(:operations)
    @polly.add_specialty(:maintenance)
    @rover.add_specialty(:operations)
    @rover.add_specialty(:maintenance)
    @sampson.add_specialty(:astrophysics)
    @sampson.add_specialty(:quantum_mechanics)
    end
  end



end
