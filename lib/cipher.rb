class Cipher

  attr_reader :raw_alphabet

  def initialize
    @raw_alphabet = ("a".."z").to_a << " "
    # @message = message
    # @key = key
    # @date = date
  end


  def last_four(date)
    (date.to_i ** 2).to_s[-4..-1]
  end

  def shift(key, date, position)
    shift_key = key[position..(position + 1)].to_i
    shift_offset = last_four(date)[position].to_i
    @raw_alphabet.rotate(shift_key + shift_offset)
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



  def a_shift(key, date)
    shift_key = key[0..1].to_i
    shift_offset = last_four(date)[0].to_i
    @raw_alphabet.rotate(shift_key + shift_offset)
  end

  def b_shift(key, date)
    shift_key = key[1..2].to_i
    shift_offset = last_four(date)[1].to_i
    @raw_alphabet.rotate(shift_key + shift_offset)
  end

  def c_shift(key, date)
    shift_key = key[2..3].to_i
    shift_offset = last_four(date)[2].to_i
    @raw_alphabet.rotate(shift_key + shift_offset)
  end

  def d_shift(key, date)
    shift_key = key[3..4].to_i
    shift_offset = last_four(date)[3].to_i
    @raw_alphabet.rotate(shift_key + shift_offset)
  end





end
