require 'enigma'
require 'date'
require 'time'
require 'pry'

class Cypher

  def initialize
    # key = []
  end

  def char_set
    ('a'..'z').to_a << ' '
  end

  def key_gen
    key = "02715"
  #   p key
  # binding.pry
  #   key.to_a
    
  end

  def date_gen
    # date = Time.new
    # date = date.strftime("%d%m%y")
    date = ('040895')
    # .to_i ** 2
    # @date = date.digits

    # digits[-4..-1]
    # binding.pry
  end

  def a_shift
    date_num = date_gen.to_i ** 2
    date_num = date_num.digits[3]
    key_num = "#{key_gen[0]}#{key_gen[1]}"
    shift = key_num.to_i + date_num
    # binding.pry
  end

  def b_shift
    date_num = date_gen.to_i ** 2
    date_num = date_num.digits[2]
    key_num = "#{key_gen[1]}#{key_gen[2]}"
    shift = key_num.to_i + date_num
  end

  def c_shift
    date_num = date_gen.to_i ** 2
    date_num = date_num.digits[1]
    key_num = "#{key_gen[2]}#{key_gen[3]}"
    shift = key_num.to_i + date_num
  end

  def d_shift
    date_num = date_gen.to_i ** 2
    date_num = date_num.digits[0]
    key_num = "#{key_gen[3]}#{key_gen[4]}"
    shift = key_num.to_i + date_num
  end

  def breakout(enigma)
    split = enigma.message.split("")
    # shift_array = []
    # binding.pry
    split.each_slice(4).to_a# {|letter| shift_array << letter}
    # shift_array
  end

  def whisk(enigma)
    letter_list = breakout(enigma)
    index_num = char_set.index(letter_list[0][0]) + a_shift
    search_index = index_num % char_set.count
    return char_set[search_index]
    # binding.pry
  end
end