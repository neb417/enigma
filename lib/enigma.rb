require 'pry'
require 'cypher'

class Enigma
  include Cypher
  attr_reader :message, :key, :date
  
  def initialize
    @message = message
    @key = key
    @date = date
    @a = 0
    @b = 1
    @c = 2
    @d = 3
  end

  def encrypt(message, key , date)
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
end
