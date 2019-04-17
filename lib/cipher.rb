class Cipher
  attr_reader :alphabet

  def initialize
    @shifter = Shifter.new
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt_slot(text, key, date, slot)
    (slot..text.size-1).step(4) { |i| if @alphabet.include?(text[i])
        text[i] = @shifter.shift(key, date, slot)[@alphabet.find_index(text[i])]
      end}
    text
  end

  def decrypt_slot(text, key, date, slot)
    (slot..text.size-1).step(4) { |i| if @alphabet.include?(text[i])
        text[i] = @alphabet[@shifter.shift(key, date, slot).find_index(text[i])]
      end}
    text
  end
end
