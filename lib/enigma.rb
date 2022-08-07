require 'pry'
require 'cypher'

class Enigma
  include Cypher
  attr_reader :message, :key, :date
  
  def initialize
    @message = message
    @key = key_gen
    @date = date_gen
    @a = 0
    @b = 1
    @c = 2
    @d = 3
  end

  def encrypt(message, key = @key, date = @date)
    encrypted_hash = {}
    @message = message
    @key = key
    @date = date
    breakout = message.split('')
    breakout = breakout.each_slice(4).to_a

    encrypted_hash[:encryption] = whisk(breakout)
    encrypted_hash[:key] = key
    encrypted_hash[:date] = date
    return encrypted_hash
    # binding.pry
  end

  def decrypt(message, key, date = @date)
    decrypted_hash = {}
    @message = message
    @key = key
    @date = date
    breakout = message.split('')
    breakout = breakout.each_slice(4).to_a

    decrypted_hash[:decryption] = decode(breakout)
    decrypted_hash[:key] = key
    decrypted_hash[:date] = date
    return decrypted_hash
  end
end
