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
      enigma.instance_variable_set(:@date, '070822')

      encrypted_hash = {encryption: "okjdvfugyrb", key: '02715', date: '070822'}

      expect(enigma.encrypt('hello world', '02715')).to eq(encrypted_hash)
    end

    it 'can decrypt without a give date' do
      enigma.instance_variable_set(:@date, '070822')
      
      decrypted_hash = {decryption: 'hello world', key: '02715', date: '070822'}

      expect(enigma.decrypt("okjdvfugyrb", '02715')).to eq(decrypted_hash)
    end

    it 'can encrypt without a given key or date' do
      enigma.instance_variable_set(:@key, '94418')
      enigma.instance_variable_set(:@date, '070822')
      
      encrypted_hash = {:encryption=>"zaggfwrjihz", :key=>"94418", :date=>"070822"}

      expect(enigma.encrypt('hello world')).to eq(encrypted_hash)
    end

    it 'can test edge cases with unknown characters' do
      enigma.instance_variable_set(:@key, '94418')
      enigma.instance_variable_set(:@date, '070822')

      encrypted_hash = {:encryption=>"zaggfwrjihz", :key=>"94418", :date=>"070822"}

      expect(enigma.encrypt('hello world!')).to eq(encrypted_hash)
    end

    it 'can test edge cases with all caps' do
      enigma.instance_variable_set(:@key, '94418')
      enigma.instance_variable_set(:@date, '070822')

      encrypted_hash = {:encryption=>"zaggfwrjihz", :key=>"94418", :date=>"070822"}

      expect(enigma.encrypt('HELLO WORLD!')).to eq(encrypted_hash)
    end
  end
end