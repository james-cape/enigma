class Cipher

  attr_reader :raw_alphabet

  def initialize
    @raw_alphabet = ("a".."z").to_a << " "
  end

  def encrypt_shift(message, key, date, position)
    (position..message.size-1).step(4) do |i|
      message[i] = a_shift(key, date)[@raw_alphabet.find_index(message[i])]
    end
  end

  #
  #
  #   (1..message.size-1).step(4) do |i|
  #     message[i] = b_shift(key, date)[@raw_alphabet.find_index(message[i])]
  #   end
  #
  #   (2..message.size-1).step(4) do |i|
  #     message[i] = c_shift(key, date)[@raw_alphabet.find_index(message[i])]
  #   end
  #
  #   (3..message.size-1).step(4) do |i|
  #     message[i] = d_shift(key, date)[@raw_alphabet.find_index(message[i])]
  #   end
  #
  #   message
  # end

  def decrypt_message(message, key, date)
    (0..message.size-1).step(4) do |i|
      message[i] = @raw_alphabet[a_shift(key, date).find_index(message[i])]
    end

    (1..message.size-1).step(4) do |i|
      message[i] = @raw_alphabet[b_shift(key, date).find_index(message[i])]
    end

    (2..message.size-1).step(4) do |i|
      message[i] = @raw_alphabet[c_shift(key, date).find_index(message[i])]
    end

    (3..message.size-1).step(4) do |i|
      message[i] = @raw_alphabet[d_shift(key, date).find_index(message[i])]
    end

    message
  end


end
