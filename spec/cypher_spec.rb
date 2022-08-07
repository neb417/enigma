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

    it 'has a char_set to choose from' do
      allow(cypher).to receive(:char_set).and_return('letter array')
      expect(cypher.char_set).to eq('letter array')
    end

    it 'can process a key into a key generator' do
      # will eventually create a random 5 digit number
      # will need to .rjust 0 if only 4 numbers
      # 'A' = [0][1], 'B' = [1][2], 'C' = [2][3] 'D' = [3][4]
      # ['A','B', 'C', 'D']
      # [02,27,71,15]
      expect(cypher.key_gen).to eq("02715")
    end

    it 'can generate a date' do
      #will generate a today's date, format to DDMMYY
      #convert to integer, square the integer, and use last 4 digits
      expect(cypher.date_gen).to eq("040895")
    end

    it 'can create an A shift' do
      # add key_gen params to date_gen param
      allow(cypher).to receive(:a_shift).and_return(3)
      expect(cypher.a_shift).to eq(3)
    end

    it 'can create an B shift' do
      # add key_gen params to date_gen param
      allow(cypher).to receive(:b_shift).and_return(27)
      expect(cypher.b_shift).to eq(27)
    end

    it 'can create an C shift' do
      # add key_gen params to date_gen param
      allow(cypher).to receive(:c_shift).and_return(73)
      expect(cypher.c_shift).to eq(73)
    end

    it 'can create an D shift' do
      # add key_gen params to date_gen param
      allow(cypher).to receive(:d_shift).and_return(20)
      expect(cypher.d_shift).to eq(20)
    end

    it 'can breakout a message into parts' do
      enigma.encrypt('hello world', '02715', '040895')
      expect(cypher.breakout(enigma)).to eq([["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]])
    end

    it 'can whisk a meassage' do
      # iterate through message and apply offest to char
      # in approptiate orders of 4.
      # 1. index of 1st letter of message in char_set- h=7
      # 2. add index of letter to a_shift. 10
      # 3. 10 % 27 = remainder
      # 4. char_set[remainder] = first new letter of string
      enigma.encrypt('hello world', '02715', '040895')

      # message.each_slice(2)
      # binding.pry
      expect(cypher.whisk(enigma)).to eq([["k", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]])
    end

    it 'can create an A shift' do
      # add key_gen params to date_gen param
      enigma.encrypt('hello world', '02715', '040895')
      cypher.breakout(enigma)


      expect(cypher.a_shift(enigma)).to eq([["k", "e", "l", "l"], ["r", " ", "w", "o"], ["u", "l", "d"]])
    end

    it 'can create an B shift' do
      # add key_gen params to date_gen param
      enigma.encrypt('hello world', '02715', '040895')

      expect(cypher.b_shift(enigma)).to eq([["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]])
    end

    it 'can create an C shift' do
      # add key_gen params to date_gen param
      enigma.encrypt('hello world', '02715', '040895')
      expect(cypher.c_shift(enigma)).to eq([["h", "e", "d", "l"], ["o", " ", "o", "o"], ["r", "l", "w"]])
    end

    it 'can create an D shift' do
      # add key_gen params to date_gen param
      enigma.encrypt('hello world', '02715', '040895')
      expect(cypher.d_shift(enigma)).to eq([["h", "e", "l", "e"], ["o", " ", "w", "h"], ["r", "l", "d"]])
    end

    xit 'can dor date_gen math and reorder for index pattern' do
      expect(cypher.date_key).to eq('1025')
    end

    xit 'use one method to perform shifts' do
      expect(cypher.shift(enigma)).to eq([['k', 'e', 'd', 'e'] ['r', ' ', 'o', 'h'],['i', 'l', 'w']])
    end
  end
end