require 'pry'
require 'cypher'

class Enigma
  include Cypher
  attr_reader :message, :key, :date
  
  def initialize
    @message = message
    @key = key_gen
    @date = date_gen
  end

  def encrypt(message, key = @key, date = @date)
    encrypted_hash = {}
# binding.pry
    breakout = message.split('')
    breakout = breakout.each_slice(4).to_a

    encrypted_hash[:encryption] = whisk(breakout, key, date)
    encrypted_hash[:key] = key
    encrypted_hash[:date] = date
    return encrypted_hash
  end

  def decrypt(message, key = @key, date = @date)
    decrypted_hash = {}

    breakout = message.split('')
    breakout = breakout.each_slice(4).to_a

    decrypted_hash[:decryption] = decode(breakout, key, date)
    decrypted_hash[:key] = key
    decrypted_hash[:date] = date
    return decrypted_hash
  end
end
