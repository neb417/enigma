require './lib/enigma'
require './lib/cypher'
require 'pry'

RSpec.describe Enigma do
  let(:enigma) {described_class.new}

  describe 'tests for Enigma' do
    it 'exists' do
      expect(enigma).to be_a(Enigma)
    end

    it 'returns an encrypted message' do
      encrypted_hash = {encryption: 'keder ohulw', key: '02715', date: '040895'}
      expect(enigma.encrypt('hello world', '02715', '040895')).to eq(encrypted_hash)
    end

    it 'can decrypt the encrypted message' do
      decrypted_hash = {decryption: 'hello world', key: '02715', date: '040895'}
      expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq(decrypted_hash)
    end

    it 'can enrypt without specified date' do
      encrypted_hash = {encryption: "okjdvfugyrb", key: '02715', date: '070822'}
      expect(enigma.encrypt('hello world', '02715')).to eq(encrypted_hash)
    end

    it 'can decrypt without a give date' do
      decrypted_hash = {decryption: 'hello world', key: '02715', date: '070822'}

      expect(enigma.decrypt("okjdvfugyrb", '02715')).to eq(decrypted_hash)
    end

    it 'can encrypt without a given key or date' do
      # enigma = double(enigma)
      # encrypted_hash = {encryption: 'keder ohulw', key: '02715', date: '040895'}
      # allow(enigma).to receive(:encrypt).and_return('hello world', '94418', '070822')
      # allow(Cypher).to receive(:key_gen).and_return('94418')
      # allow(Cypher).to receive(:date_gen).and_return('070822')
      # allow(enigma).to receive(:key_gen).and_return('94418')
      # allow(enigma).instance_variable_set(:date, '070822')
      # allow(enigma).to receive(:date).and_return('070822')
      # binding.pry
      expect(enigma.encrypt('hello world')).to eq({:encryption=>"zaggfwrjihz", :key=>"94418", :date=>"070822"})
    end
  end
end