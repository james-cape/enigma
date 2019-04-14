class Cipher

  attr_reader :raw_alphabet

  def initialize
    @raw_alphabet = ("a".."z").to_a << " "
  end

  def last_four(date)
    (date.to_i ** 2).to_s[-4..-1]
  end

# Uses key and date to determine shift factor
  def shift(key, date, position)
    shift_key = key[position..(position + 1)].to_i
    shift_offset = last_four(date)[position].to_i
    @raw_alphabet.rotate(shift_key + shift_offset)
  end

# Applies shift factor to string
  def encrypt_position(message, key, date, position)
    (position..message.size-1).step(4) do |i|
      message[i] = shift(key, date, position)[@raw_alphabet.find_index(message[i])]
    end
    message
  end

  # Applies shift factor to string
  def decrypt_position(message, key, date, position)
    (position..message.size-1).step(4) do |i|
      message[i] = @raw_alphabet[shift(key, date, position).find_index(message[i])]
    end
    message
  end
end
