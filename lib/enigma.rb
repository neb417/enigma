require_relative 'cipher'

class Enigma
  include Cipher
  attr_reader :key, :date

  def initialize
    @key = key_gen
    @date = date_gen
  end

  def encrypt(message, key = @key, date = @date)
    encrypted_hash = {}
    brokeout = breakout(message)

    encrypted_hash[:encryption] = whisk(brokeout, key, date, char_set)
    encrypted_hash[:key] = key
    encrypted_hash[:date] = date
    encrypted_hash
  end

  def decrypt(message, key = @key, date = @date)
    decrypted_hash = {}
    brokeout = breakout(message)

    decrypted_hash[:decryption] = whisk(brokeout, key, date, char_set.reverse)
    decrypted_hash[:key] = key
    decrypted_hash[:date] = date
    decrypted_hash
  end

  # def crack(message, date)
  #   cracked_hash = {}
  #   breakout(message)
  #   cracked_hash[:decryption] = cracker(message, date, char_set.reverse)
  #   cracked_hash[:key] = key.reverse
  #   cracked_hash[:date] = date.reverse
  #   cracked_hash
  # end
end
