require 'rspec'
require_relative 'permutation_solution'

RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.describe '#permutation_checker' do 
  it 'should accept two arguments' do 
    expect{permutation_checker("caliber")}.to raise_error ArgumentError
    expect{permutation_checker("caliber", "eclair", "butterscotch")}.to raise_error ArgumentError
    expect{permutation_checker("caliber", "eclair")}.to_not raise_error ArgumentError
  end

  it 'should return a boolean' do 
    # skip
    expect([true, false]).to include permutation_checker("caliber", "eclair")
    expect([true, false]).to include permutation_checker("caliber", "bob")
  end

  it 'should return ture for a correct permutation' do 
    # skip
    expect(permutation_checker("caliber", "eclair")).to eq true
  end

  it 'should return false for an incorrect permutation' do 
    # skip
    expect(permutation_checker("caliber", "bob")).to eq false
  end

  it 'should not accept duplicate letters from base word as part of the permutation' do 
    # skip
    expect(permutation_checker("caliber", "calberr")).to eq false
  end
end