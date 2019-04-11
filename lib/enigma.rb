class Enigma

  attr_reader :today,
              :random_key

  def initialize
    time = Time.new
    @today = "#{time.month}#{time.day}#{time.year}".rjust(8,"0")
    @random_key = 5.times.map{rand(10)}.join
    @raw_alphabet = ("a".."z").to_a << " "
  end


  def encrypt(message, key = random_key, date = today)
    components = Hash.new(0)

    components[:encryption] = shift_message(message, key, date)
    components[:key] = key
    components[:date] = date
    components
  end

  def shift_message(message, key, date)
    (0..message.size-1).step(4) do |i|
      message[i] = a_shift(key, date)[@raw_alphabet.find_index(message[i])]
    end
    (1..message.size-1).step(4) do |i|
      message[i] = b_shift(key, date)[@raw_alphabet.find_index(message[i])]
    end
    (2..message.size-1).step(4) do |i|
      message[i] = c_shift(key, date)[@raw_alphabet.find_index(message[i])]
    end
    (3..message.size-1).step(4) do |i|
      message[i] = d_shift(key, date)[@raw_alphabet.find_index(message[i])]
    end
    message
  end

  def last_four(date)
    (date.to_i ** 2).to_s[-4..-1]
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
