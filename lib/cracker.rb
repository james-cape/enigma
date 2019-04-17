class Cracker
  attr_reader :keys

  def initialize
    @cipher = Cipher.new
    @keys = (0..99999).to_a
    @alphabet = ("a".."z").to_a << " "
    @enigma = Enigma.new(@cipher)
  end

  def find_key(message, date = today)
    @keys.find do |integer_key|
      string_key = integer_key.to_s.rjust(5, "0")
      @enigma.decrypt(message, string_key, date)[:decryption][-4..-1] == " end"
    end.to_s.rjust(5, "0")
  end
end
