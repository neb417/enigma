require './lib/enigma'
require './lib/cypher'
require 'pry'

RSpec.describe Cypher do
  let(:cypher) {described_class.new}

  describe 'tests for Cypher class' do
    it 'exists' do
      expect(cypher).to be_a(Cypher)
    end

    
  end
end