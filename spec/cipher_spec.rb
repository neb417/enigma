require './lib/enigma'
require './lib/cipher'

RSpec.describe Cipher do
  let(:cipher) {described_class.new}
  let(:enigma) {Enigma.new}

  contex 'These tests were used when Cipher was a Class' do
  end

  describe 'tests for Cipher class with enigma.encrypt(all arguments)' do

    before(:each) do
      enigma.encrypt('hello world', '02715', '040895')
    end

    xit 'exists' do
      expect(cipher).to be_a(Cipher)
    end

    xit 'has a char_set to choose from' do
      allow(cipher).to receive(:char_set).and_return('letter array')
      expect(cipher.char_set).to eq('letter array')
    end

    xit 'can process a key into a key generator' do
      # will eventually create a random 5 digit number
      # will need to .rjust 0 if only 4 numbers
      # 'A' = [0][1], 'B' = [1][2], 'C' = [2][3] 'D' = [3][4]
      # ['A','B', 'C', 'D']
      # [02,27,71,15]
      expect(cipher.key_gen).to eq("02715")
    end

    xit 'can generate a date' do
      #will generate a today's date, format to DDMMYY
      #convert to integer, square the integer, and use last 4 digits
      expect(cipher.date_gen).to eq("040895")
    end

    xit 'can create an A shift' do
      # add key_gen params to date_gen param
      allow(cipher).to receive(:a_shift).and_return(3)
      expect(cipher.a_shift).to eq(3)
    end

    xit 'can create an B shift' do
      # add key_gen params to date_gen param
      allow(cipher).to receive(:b_shift).and_return(27)
      expect(cipher.b_shift).to eq(27)
    end

    xit 'can create an C shift' do
      # add key_gen params to date_gen param
      allow(cipher).to receive(:c_shift).and_return(73)
      expect(cipher.c_shift).to eq(73)
    end

    xit 'can create an D shift' do
      # add key_gen params to date_gen param
      allow(cipher).to receive(:d_shift).and_return(20)
      expect(cipher.d_shift).to eq(20)
    end

    xit 'can breakout a message into parts' do
      enigma.encrypt('hello world', '02715', '040895')
      expect(cipher.breakout(enigma)).to eq([["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]])
    end

    xit 'can whisk a meassage' do
      # iterate through message and apply offest to char
      # in approptiate orders of 4.
      # 1. index of 1st letter of message in char_set- h=7
      # 2. add index of letter to a_shift. 10
      # 3. 10 % 27 = remainder
      # 4. char_set[remainder] = first new letter of string
      enigma.encrypt('hello world', '02715', '040895')

      # message.each_slice(2)
      # binding.pry
      allow(cipher).to receive(:whisk).and_return(20)
      expect(cipher.whisk(enigma)).to eq(20)
    end

    xit 'can create an A shift' do
      # add key_gen params to date_gen param
      enigma.encrypt('hello world', '02715', '040895')
      cipher.breakout(enigma)


      expect(cipher.a_shift(enigma)).to eq([["k", "e", "l", "l"], ["r", " ", "w", "o"], ["u", "l", "d"]])
    end

    xit 'can create an B shift' do
      # add key_gen params to date_gen param
      enigma.encrypt('hello world', '02715', '040895')

      expect(cipher.b_shift(enigma)).to eq([["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]])
    end

    xit 'can create an C shift' do
      # add key_gen params to date_gen param
      enigma.encrypt('hello world', '02715', '040895')
      expect(cipher.c_shift(enigma)).to eq([["h", "e", "d", "l"], ["o", " ", "o", "o"], ["r", "l", "w"]])
    end

    xit 'can create an D shift' do
      # add key_gen params to date_gen param
      enigma.encrypt('hello world', '02715', '040895')
      expect(cipher.d_shift(enigma)).to eq([["h", "e", "l", "e"], ["o", " ", "w", "h"], ["r", "l", "d"]])
    end

    xit 'can dor date_gen math and reorder for index pattern' do
      expect(cipher.date_key).to eq('1025')
    end

    xit 'uses one method to create shift_keys' do
      allow(cipher).to receive(:shift_key).and_return(3)
      expect(cipher.shift_key).to eq(3)#[['k', 'e', 'd', 'e'] ['r', ' ', 'o', 'h'],['i', 'l', 'w']])
    end

    xit 'uses one method to perform shifts' do
      expect(cipher.whisk(enigma)).to eq("keder ohulw")
    end
  end
end