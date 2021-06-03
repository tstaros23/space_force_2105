require 'rspec'
require './lib/person'

describe do Person
  before :each do
    @kathy = Person.new('Kathy Chan', 10)
  end
  it 'exists' do
    expect(@kathy).to be_a(Person)
  end

  it 'has attributes' do
    expect(@kathy.name).to eq("Kathy Chan")
    expect(@kathy.experience).to eq(10)
    expect(@kathy.specialities).to eq([])
  end

  it 'adds specialities' do

    @kathy.add_specialty(:astrophysics)
    @kathy.add_specialty(:quantum_mechanics)

    expect(@kathy.specialities).to eq([:astrophysics, :quantum_mechanics])
  end

end
