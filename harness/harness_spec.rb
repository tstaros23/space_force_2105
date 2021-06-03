require 'rspec'
require './lib/spacecraft'
require './lib/person'
require './lib/flotilla'

RSpec.configure do |config|
  config.default_formatter = 'doc'
end

RSpec.describe 'Space Force Spec Harness 🚀' do
  before :each do
    @daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    @odyssey = Spacecraft.new({name: 'Odyssey', fuel: 300})
    @prometheus = Spacecraft.new({name: 'Prometheus', fuel: 300})

    @kathy = Person.new('Kathy Chan', 10)
    @polly = Person.new('Polly Parker', 8)
    @rover = Person.new('Rover Henriette', 1)
    @sampson = Person.new('Sampson Edwards', 7)

    @seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})
  end

  describe 'Iteration 1' do
    it '1. Spacecraft creation' do
      expect(Spacecraft).to respond_to(:new).with(1).argument
      expect(@daedalus).to be_an_instance_of(Spacecraft)
    end

    it '2. Spacecraft attributes' do
      expect(Spacecraft).to respond_to(:name).with(0).argument
      expect(@daedalus.name).to eq('Daedalus')  

      expect(Spacecraft).to respond_to(:fuel).with(0).argument
      expect(@daedalus.fuel).to eq(400)
    end

    it '3. Person creation' do
      expect(Person).to respond_to(:new).with(2).argument
      expect(@sampson).to be_an_instance_of(Person)
    end

    it '4. Person attributes' do
      expect(Person).to respond_to(:name).with(0).argument
      expect(@sampson.name).to eq('Sampson Edwards')
      
      expect(Person).to respond_to(:experience).with(0).argument
      expect(@sampson.experience).to eq(7)
      
      expect(Person).to respond_to(:specialties).with(0).argument
      expect(@sampson.specialties).to eq([])
    end

    it '5. Person can add specialties' do
      expect(Person).to respond_to(:add_specialty).with(1).argument

      @sampson.add_specialty(:something)
      @sampson.add_specialty(:completely_different)

      expect(@sampson.specialties).to eq([:something, :completely_different])
    end
  end

  describe 'Iteration 2' do
    it '1. Flotilla creation' do
      expect(Flotilla).to respond_to(:new).with(1).argument
      expect(@seventh_flotilla).to be_an_instance_of(Flotilla)
    end

    it '2. Flotilla attributes' do
      expect(Flotilla).to respond_to(:name).with(0).argument
      expect(@seventh_flotilla.name).to eq('Seventh Flotilla')

      expect(Flotilla).to respond_to(:personnel).with(0).argument
      expect(@seventh_flotilla.personnel).to eq([])

      expect(Flotilla).to respond_to(:ships).with(0).argument
      expect(@seventh_flotilla.ships).to eq([])
    end

    it '3. Flotilla adds people' do
      expect(Flotilla).to respond_to(:add_personnel).with(1).argument

      @seventh_flotilla.add_personnel(@sampson)
      @seventh_flotilla.add_personnel(@rover)

      expect(@seventh_flotilla.personnel).to eq([@sampson, @rover])
    end

    it '4. Ship has requirements - and can add requirements' do
      expect(Ship).to respond_to(:requirements).with(0).argument
      
      expect(@prometheus.requirements).to eq([])

      expect(Ship).to respond_to(:add_requirement).with(1).argument

      @prometheus.add_requirement({operations: 6})
      @prometheus.add_requirement({maintenance: 3})

      expected = [{operations: 6}, {maintenance: 3}]

      expect(@prometheus.requirements).to eq(expected)
    end

    it '5. Flotilla recommends personnel' do
      @kathy.add_specialty(:astrophysics)
      @kathy.add_specialty(:quantum_mechanics)
      @polly.add_specialty(:operations)
      @polly.add_specialty(:maintenance)
      @rover.add_specialty(:operations)
      @rover.add_specialty(:maintenance)
      @sampson.add_specialty(:astrophysics)
      @sampson.add_specialty(:quantum_mechanics)

      @seventh_flotilla.add_personnel(@kathy)
      @seventh_flotilla.add_personnel(@polly)
      @seventh_flotilla.add_personnel(@rover)
      @seventh_flotilla.add_personnel(@sampson)
      
      @daedalus.add_requirement({astrophysics: 6})
      @daedalus.add_requirement({quantum_mechanics: 3})

      expect(Flotilla).to respond_to(:recommend_personnel).with(1).argument
      expect(@seventh_flotilla.recommend_personnel(@daedalus)).to eq([@kathy])
    end
  end

  describe 'Iteration 3' do
    before :each do
      @kathy.add_specialty(:astrophysics)
      @kathy.add_specialty(:quantum_mechanics)
      @polly.add_specialty(:operations)
      @polly.add_specialty(:maintenance)
      @rover.add_specialty(:operations)
      @rover.add_specialty(:maintenance)
      @sampson.add_specialty(:astrophysics)
      @sampson.add_specialty(:quantum_mechanics)

      @seventh_flotilla.add_personnel(@kathy)
      @seventh_flotilla.add_personnel(@polly)
      @seventh_flotilla.add_personnel(@rover)
      @seventh_flotilla.add_personnel(@sampson)
      
      @daedalus.add_requirement({astrophysics: 6})
      @daedalus.add_requirement({quantum_mechanics: 3})

      @odyssey.add_requirement({operations: 6})
      @odyssey.add_requirement({maintenance: 3})
    end

    it '1. Flotilla adds ships' do
      expect(Flotilla).to respond_to(:add_ship).with(1).argument
      
      @seventh_flotilla.add_ship(@odyssey)
      @seventh_flotilla.add_ship(@prometheus)

      expect(@seventh_flotilla.ships).to eq([@odyssey, @prometheus])
    end    
    

    it '2. Flotilla Personnel by ship' do
      @seventh_flotilla.add_ship(@daedalus)
      @seventh_flotilla.add_ship(@odyssey)    

      expect(Flotilla).to respond_to(:personnel_by_ship).with(0).argument
      
      expected = {
        @odyssey => [@kathy, @sampson],
        @prometheus => [@polly]
      }

      expect(@seventh_flotilla.personnel_by_ship).to eq(expected)
      
    end
  end
  
  describe 'Iteration 4' do
    it '1. Flotilla ready ships' do
      @kathy.add_specialty(:astrophysics)
      @kathy.add_specialty(:quantum_mechanics)
      @polly.add_specialty(:operations)
      @polly.add_specialty(:maintenance)
      @rover.add_specialty(:operations)
      @rover.add_specialty(:maintenance)
      @sampson.add_specialty(:astrophysics)
      @sampson.add_specialty(:quantum_mechanics)

      @seventh_flotilla.add_personnel(@kathy)
      @seventh_flotilla.add_personnel(@polly)
      @seventh_flotilla.add_personnel(@rover)
      @seventh_flotilla.add_personnel(@sampson)
      
      @daedalus.add_requirement({astrophysics: 6})
      @daedalus.add_requirement({quantum_mechanics: 3})

      @prometheus.add_requirement({operations: 6})
      @prometheus.add_requirement({science: 1}) 

      @seventh_flotilla.add_ship(@daedalus)
      @seventh_flotilla.add_ship(@prometheus)

      expect(Flotilla).to respond_to(:ready_ships).with(1).argument

      expect(@seventh_flotilla.ready_ships(100)).to eq([@daedalus])
    end
  end
end
