class Cipher
  attr_reader :alphabet

  def initialize
    @shifter = Shifter.new
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt_slot(message, key, date, slot)
    (slot..message.size-1).step(4) do |i|
      message[i] = @shifter.shift(key, date, slot)[@alphabet.find_index(message[i])]
    end
    message
  end

  def decrypt_slot(message, key, date, slot)
    (slot..message.size-1).step(4) do |i|
      message[i] = @alphabet[@shifter.shift(key, date, slot).find_index(message[i])]
    end
    message
  end
end
