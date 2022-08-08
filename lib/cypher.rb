require 'enigma'
require 'date'
require 'time'
require 'pry'

module Cypher

  def char_set
    ('a'..'z').to_a << ' '
  end

  def key_gen
    random = rand(0..99999)
    random.to_s.rjust(5, "0")
  end

  def date_gen
    date = Time.new
    date = date.strftime("%d%m%y")
  end

  def date_key(date)
    date_key = (date.to_i ** 2).to_s
    date_key = date_key.slice(-4..-1)
    date_key.rjust(4,"0")
  end
  
  def shift_key(index, key, date)
    date_num = date_key(date).split('')
    date_num = date_num[index]
    key_num = "#{key[index]}#{key[index +1]}"
    return key_num.to_i + date_num.to_i
  end
  
  def whisk(breakout, key, date)
    encryption =[]
    breakout.each do |element|
      element.each_with_index do |char, index|
        index_num = char_set.index(char) + shift_key(index, key, date)
        search_index = index_num % char_set.count
        encryption << char_set[search_index]
      end
    end
    encryption.join
  end

  def decode (breakout, key, date)
    set_char = char_set.reverse
    decryption = []
    breakout.each do |element|
      element.each_with_index do |char, index|
        index_num = set_char.index(char) + shift_key(index, key, date)
        search_index = index_num % char_set.count
        decryption << set_char[search_index]
      end
    end
    decryption.join
  end
end