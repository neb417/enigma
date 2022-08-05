require './lib/enigma'
require 'pry'

RSpec.describe Enigma do
  let(:enigma) {described_class.new}

  describe 'tests for Enigma' do
    it 'exists' do
      expect(enigma).to be_a(Enigma)
    end

    xit 'returns an encrypted message' do
      encrypted_hash = {encryption: 'keder ohulw', key: '02715', date: '040895'}
      expect(enigma.encrypt('hello world', '02715', '040895')).to eq(encrypted_hash)
    end

    xit 'can decrypt the encrypted message' do
      decrypted_hash = {encryption: 'hello world', key: '02715', date: '040895'}
      expect(enigma.decrypt('keder ohulw', '02715', '040895'))
    end

    xit 'can enrypt without specified date' do
      expect(enigma.encrypt('hello world', '02715')).to eq(expected_hash)
    end

    xit 'can decrypt without a give date' do
      expect(enigma.decrypt(encrypted[:encryption], '02715')).to eq(expected_hash)
    end

    xit 'can encrypt without a given key or date' do
      expect(enigma.encrypt('hello world')).to eq(expected_hash)
    end
  end
end