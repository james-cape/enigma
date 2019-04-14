class Cipher

  attr_reader :raw_alphabet

  def initialize
    @raw_alphabet = ("a".."z").to_a << " "
  end


  def last_four(date)
    (date.to_i ** 2).to_s[-4..-1]
  end

# position is first, second, third, or fourth position in the string.
  def shift(key, date, position)
    shift_key = key[position..(position + 1)].to_i
    shift_offset = last_four(date)[position].to_i
    @raw_alphabet.rotate(shift_key + shift_offset)
  end



  def encrypt_message(message, key, date, position)
    (position..message.size-1).step(4) do |i|
      message[i] = shift(key, date, position)[@raw_alphabet.find_index(message[i])]
    end
    message
  end

  def decrypt_message(message, key, date, position)
    (position..message.size-1).step(4) do |i|
      message[i] = @raw_alphabet[shift(key, date, position).find_index(message[i])]
    end
    message
  end


end
