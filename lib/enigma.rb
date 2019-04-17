class Enigma
  attr_reader :today,
              :random_key

  def initialize(cracker = nil)
    @today = Time.now.strftime("%d%m%y")
    @random_key = 5.times.map{rand(10)}.join
    @cipher = Cipher.new
    @cracker = cracker
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key = random_key, date = today)
    components = Hash.new(0)
    components[:encryption] = encrypt_full_message(message.downcase, key, date)
    components[:key] = key
    components[:date] = date
    components
  end

  def decrypt(message, key = random_key, date = today)
    components = Hash.new(0)
    components[:decryption] = decrypt_full_message(message.downcase.dup, key, date)
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

  def crack(cipher_text, date = today)
    key_value = @cracker.find_key(cipher_text, date)
    decryption = decrypt_full_message(cipher_text, key_value, date)
    { decryption: decryption,
      date: date,
      key: key_value }
  end
end
