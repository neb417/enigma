require 'pry'

class Enigma
  attr_reader :message, :key, :date
  
  def initialize
    @message = message
    @key = key
    @date = date
  end

  def encrypt(message, key, date)
    @message = message
    @key = key
    @date = date
  end
end
