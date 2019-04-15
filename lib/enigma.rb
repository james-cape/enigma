class Enigma

  attr_reader :today,
              :random_key

  def initialize(cipher)
    @today = Time.new.strftime("%d%m%y")
    @random_key = 5.times.map{rand(10)}.join
    @cipher = cipher
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key = random_key, date = today)
    components = Hash.new(0)
    components[:encryption] = encrypt_full_message(message, key, date)
    components[:key] = key
    components[:date] = date
    components
  end

  def decrypt(message, key = random_key, date = today)
    components = Hash.new(0)
    components[:decryption] = decrypt_full_message(message, key, date)
    components[:key] = key
    components[:date] = date
    components
  end

  def encrypt_full_message(message, key, date)
    @cipher.encrypt_slot(message, key, date, 0)
    @cipher.encrypt_slot(message, key, date, 1)
    @cipher.encrypt_slot(message, key, date, 2)
    @cipher.encrypt_slot(message, key, date, 3)
    message
  end

  def decrypt_full_message(message, key, date)
    @cipher.decrypt_slot(message, key, date, 0)
    @cipher.decrypt_slot(message, key, date, 1)
    @cipher.decrypt_slot(message, key, date, 2)
    @cipher.decrypt_slot(message, key, date, 3)
    message
  end

  # date is always given (argument or today's)

  def find_key(cipher_text)
    shift_1 = (@alphabet.find_index(cipher_text[-4]) - @alphabet.find_index(" ") + 27) % 27
    shift_2 = (@alphabet.find_index(cipher_text[-3]) - @alphabet.find_index("e") + 27) % 27
    shift_3 = (@alphabet.find_index(cipher_text[-2]) - @alphabet.find_index("n") + 27) % 27
    shift_4 = (@alphabet.find_index(cipher_text[-1]) - @alphabet.find_index("d") + 27) % 27
    [shift_1, shift_2, shift_3, shift_4].rotate(cipher_text.size % 4)
  end

  # def find_date_key(cipher_text, date = today)
  #   find_key(cipher_text).each do |key|
  # end



# Uses key and date to determine shift factor
  def shift(key, date, slot)
    shift_key = key[slot..(slot + 1)].to_i
    shift_offset = last_four(date)[slot].to_i
    @alphabet.rotate(shift_key + shift_offset)
  end

# Applies shift factor to string
  def encrypt_slot(message, key, date, slot)
    (slot..message.size-1).step(4) do |i|
      message[i] = shift(key, date, slot)[@alphabet.find_index(message[i])]
    end
    message
  end

end
