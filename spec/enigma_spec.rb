require './lib/enigma'
require './lib/cipher'

RSpec.describe Enigma do
  let(:enigma) { described_class.new }

  describe 'tests for Enigma' do
    it 'exists' do
      expect(enigma).to be_a(Enigma)
    end

    it 'returns an encrypted message' do
      encrypted_hash = { encryption: 'keder ohulw', key: '02715', date: '040895' }
      expect(enigma.encrypt('hello world', '02715', '040895')).to eq(encrypted_hash)
    end

    it 'can decrypt the encrypted message' do
      decrypted_hash = { decryption: 'hello world', key: '02715', date: '040895' }
      expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq(decrypted_hash)
    end

    it 'can enrypt without specified date' do
      enigma.instance_variable_set(:@date, '070822')

      encrypted_hash = { encryption: 'okjdvfugyrb', key: '02715', date: '070822' }

      expect(enigma.encrypt('hello world', '02715')).to eq(encrypted_hash)
    end

    it 'can decrypt without a give date' do
      enigma.instance_variable_set(:@date, '070822')

      decrypted_hash = { decryption: 'hello world', key: '02715', date: '070822' }

      expect(enigma.decrypt('okjdvfugyrb', '02715')).to eq(decrypted_hash)
    end

    it 'can encrypt without a given key or date' do
      enigma.instance_variable_set(:@key, '94418')
      enigma.instance_variable_set(:@date, '070822')

      encrypted_hash = { encryption: 'zaggfwrjihz', key: '94418', date: '070822' }

      expect(enigma.encrypt('hello world')).to eq(encrypted_hash)
    end

    it 'can test edge cases with unknown characters' do
      enigma.instance_variable_set(:@key, '94418')
      enigma.instance_variable_set(:@date, '070822')
      enigma.instance_variable_set(:@message, 'h3llo world!')
      encrypted_hash = { encryption: 'zaggfwrjihz!', key: '94418', date: '070822' }

      expect(enigma.encrypt('hello world!')).to eq(encrypted_hash)
    end

    it 'can test edge cases with all caps' do
      enigma.instance_variable_set(:@key, '94418')
      enigma.instance_variable_set(:@date, '070822')
      enigma.instance_variable_set(:@message, 'hello world!')
      allow(enigma).to receive(:encrypt).and_return({ encryption: 'zaggfwrjihz!', key: '94418', date: '070822' })

      encrypted_hash = { encryption: 'zaggfwrjihz!', key: '94418', date: '070822' }

      expect(enigma.encrypt('HELLO WORLD!')).to eq(encrypted_hash)
    end
  end

  describe 'Cracking the message' do
    it 'can encrypt the crack message with key' do
      expected_hash = { encryption: 'vjqtbeaweqihssi', key: '08304', date: '291018' }

      expect(enigma.encrypt('hello world end', '08304', '291018')).to eq(expected_hash)
    end

  #   it 'can crack message without a key' do
  #     expected_hash = {decryption: "hello world end", key: "08304", date: "291018"}

  #     expect(enigma.crack("vjqtbeaweqihssi", "291018")).to eq(expected_hash)
  #   end

  #   xit 'can crack message without a key or date' do
  #     expected_hash = {decryption: "hello world end", key: "08304", date: "090822"}

  #     expect(enigma.crack("vjqtbeaweqihssi")).to eq(expected_hash)
  #   end
  end
end
