require './lib/enigma'
require './lib/cypher'
require 'pry'

RSpec.describe Cypher do
  let(:cypher) {described_class.new}
  let(:enigma) {Enigma.new}

  describe 'tests for Cypher class with enigma.encrypt(all arguments)' do

    before(:each) do
      enigma.encrypt('hello world', '02715', '040895')
    end

    it 'exists' do
      expect(cypher).to be_a(Cypher)
    end

    xit 'has a char_set to choose from' do
      allow(cypher).to receive(:char_set).and_return('letter array')
      expect(cypher.char_set).to eq('letter array')
    end

    xit 'can process a key into a deadbolt' do
      # will eventually create a random 5 digit number
      # will need to .rjust 0 if only 4 numbers
      # A = [0][1], B = [1][2], C = [2][3] D = [3][4]
      expect(cypher.deadbolt).to eq({'A': 02, 'B': 27, 'C': 71, 'D': 15})
    end

    xit 'can process a date to ballast' do
      #will generate a today's date, format to DDMMYY
      #convert to integer, square the integer, and use last 4 digits
      expect(cypher.ballast).to eq('1025')
    end

    xit 'can create an offset' do
      # add deadbolt and ballast
      expect(cypher.offset).to eq({'A': 1, 'B': 0, 'C': 2, 'D': 5})
    end

    xit 'can apply whisk a meassage' do
      # iterate through message and apply offest to char
      # in approptiate orders of 4.
      expect(cypher.whisk).to eq('keder ohulw')
    end
  end
end