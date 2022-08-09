require './lib/enigma'
require './lib/cipher'
require 'time'

RSpec.describe Cipher do
  let(:enigma) {Enigma.new}

  describe 'tests for Cipher class with enigma.encrypt(all arguments)' do

    before(:each) do
      enigma.encrypt('hello world', '02715', '040895')
    end

    it 'has a char_set to choose from' do
      allow(enigma).to receive(:char_set).and_return('letter array')
      expect(enigma.char_set).to eq('letter array')
    end
    
    it 'can process a key into a key generator' do
      allow(enigma).to receive(:key_gen).and_return("02715")
      expect(enigma.key_gen).to eq("02715")
    end
    
    it 'can generate a date' do
      allow(enigma).to receive(:date_gen).and_return("040895")
      expect(enigma.date_gen).to eq("040895")
    end

    it 'can breakout a message into parts' do
      enigma.encrypt('hello world', '02715', '040895')
      expect(enigma.breakout('hello world')).to eq([["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]])
    end
    
    it 'can generate a date key from date to string' do
      expect(enigma.date_key(40895)).to eq('1025')
    end

    it 'can whisk a meassage' do
      brokeout = enigma.breakout('hello world')
      key = enigma.key
      date = enigma.date
      char_set = enigma.char_set
  
      allow(enigma).to receive(:whisk).and_return('a string')
      expect(enigma.whisk(brokeout, key, date, char_set)).to eq('a string')
    end
  end
end