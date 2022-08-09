require 'time'

module Cipher

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

  def breakout(message)
    lists_of_four = message.split('')
    lists_of_four = lists_of_four.each_slice(4).to_a
    lists_of_four
  end
  
  def whisk(brokeout, key, date, char_set)
    encryption =[]
    brokeout.each do |element|
      element.each_with_index do |char, index|
        if !char_set.include?(char)
          encryption << char
        else
        index_num = char_set.index(char) + shift_key(index, key, date)
        search_index = index_num % char_set.count
        encryption << char_set[search_index]
        end
      end
    end
    encryption.join
  end

  def crack_shift_key(index, key, date)
    date_num = date_key(date).split('')
    date_num = date_num[index]
    key_num = "#{key[index]}#{key[index +1]}"
    return key_num.to_i + date_num.to_i
  end

  def cracker(breakout, date, char_set)
    encryption =[]
    breakout.each do |element|
      element.each_with_index do |char, index|
        if !char_set.include?(char)
          encryption << char
        else
        index_num = char_set.index(char) + crack_shift_key(index, key, date)
        search_index = index_num % char_set.count
        encryption << char_set[search_index]
        end
      end
    end
    encryption.join
  end
end