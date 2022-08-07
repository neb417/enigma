require 'enigma'
require 'date'
require 'time'
require 'pry'

module Cypher

  def initialize
    @a = 0
    @b = 1
    @c = 2
    @d = 3
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

  def date_key
    date_key = (date_gen.to_i ** 2).to_s
    date_key = date_key.slice(-4..-1)
    date_key.rjust(4,"0")
  end
  
  def breakout(enigma)
    split = enigma.message.split("")
    # shift_array = []
    # binding.pry
    split.each_slice(4).to_a# {|letter| shift_array << letter}
    # shift_array
  end
  
  def encrypt_message
    breakout(enigma)
  end
  
  def shift_key(instance_letter)
    date_num = date_key.split('')
    date_num = date_num[instance_letter]
    key_num = "#{key_gen[instance_letter]}#{key_gen[instance_letter +1]}"
    return key_num.to_i + date_num.to_i
  end
  
  def whisk(breakout)
    a_shift = shift_key(@a)
    b_shift = shift_key(@b)
    c_shift = shift_key(@c)
    d_shift = shift_key(@d)
    # binding.pry

    # letter_list = breakout(enigma)
      encryption = breakout.each do |element|
        a_index_num = char_set.index(element[@a]) + a_shift
        b_index_num = char_set.index(element[@b]) + b_shift
        c_index_num = char_set.index(element[@c]) + c_shift
        d_index_num = char_set.index(element[@d]) + d_shift if !element[@d].nil?
  
        a_search_index = a_index_num % char_set.count
        b_search_index = b_index_num % char_set.count
        c_search_index = c_index_num % char_set.count
        d_search_index = d_index_num % char_set.count if !element[@d].nil?

        element[@a] = char_set[a_search_index]
        element[@b] = char_set[b_search_index]
        element[@c] = char_set[c_search_index]
        element[@d] = char_set[d_search_index] if !element[@d].nil?
        
        element.rotate
      end
      encryption.join #flatten.join
    # binding.pry
  end

  def decode (breakout)
    a_shift = shift_key(@a)
    b_shift = shift_key(@b)
    c_shift = shift_key(@c)
    d_shift = shift_key(@d)
    set_char = char_set.reverse
    # binding.pry

    # letter_list = breakout(enigma)
      decryption = breakout.each do |element|
        a_index_num = set_char.index(element[@a]) + a_shift
        b_index_num = set_char.index(element[@b]) + b_shift
        c_index_num = set_char.index(element[@c]) + c_shift
        d_index_num = set_char.index(element[@d]) + d_shift if !element[@d].nil?
        a_search_index = a_index_num % char_set.count
        b_search_index = b_index_num % char_set.count
        c_search_index = c_index_num % char_set.count
        d_search_index = d_index_num % char_set.count if !element[@d].nil?

        element[@a] = set_char[a_search_index]
        element[@b] = set_char[b_search_index]
        element[@c] = set_char[c_search_index]
        element[@d] = set_char[d_search_index] if !element[@d].nil?
        
        element.rotate
      end
      decryption.join #flatten.join
   
  end

  # def a_shift(enigma)
  #   date_num = date_gen.to_i ** 2
  #   date_num = date_num.digits[3]
  #   key_num = "#{key_gen[0]}#{key_gen[1]}"
  #   shift = key_num.to_i + date_num
  #   # binding.pry

  #   letter_list = breakout(enigma)
  #   letter_list.each do |element|
  #     index_num = char_set.index(element[0]) + shift
  #     search_index = index_num % char_set.count
  #     element[0] = char_set[search_index]
  #     element.rotate
  #   end
  #   letter_list
  # end

  # def b_shift(enigma)
  #   date_num = date_gen.to_i ** 2
  #   date_num = date_num.digits[2]
  #   key_num = "#{key_gen[1]}#{key_gen[2]}"
  #   shift = key_num.to_i + date_num

  #   letter_list = breakout(enigma)
  #   letter_list.each do |element|
  #     index_num = char_set.index(element[1]) + shift
  #     search_index = index_num % char_set.count
  #     element[1] = char_set[search_index]
  #     element.rotate
  #   end
  #   letter_list
  # end

  # def c_shift(enigma)
  #   date_num = date_gen.to_i ** 2
  #   date_num = date_num.digits[1]
  #   key_num = "#{key_gen[2]}#{key_gen[3]}"
  #   shift = key_num.to_i + date_num

  #   letter_list = breakout(enigma)
  #   letter_list.each do |element|
  #     index_num = char_set.index(element[2]) + shift
  #     search_index = index_num % char_set.count
  #     element[2] = char_set[search_index]
  #     element.rotate
  #   end
  #   letter_list
  # end

  # def d_shift(enigma)
  #   date_num = date_gen.to_i ** 2
  #   date_num = date_num.digits[0]
  #   key_num = "#{key_gen[3]}#{key_gen[4]}"
  #   shift = key_num.to_i + date_num

  #   letter_list = breakout(enigma)
  #   letter_list.each do |element|
  #     next if element[3] == nil 
  #     index_num = char_set.index(element[3]) + shift
  #     search_index = index_num % char_set.count
  #     element[3] = char_set[search_index]
  #     element.rotate
  #   end
  #   letter_list
  # end
end