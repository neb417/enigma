require 'date'
require 'time'
require 'pry'

class Cypher

  def initialize
    @key = []
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
  end

  # def whisk
  #   binding.pry
  # end
end