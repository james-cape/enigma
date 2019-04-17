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

  def encrypt(text, key = random_key, date = today)
    results = Hash.new(0)
    results[:encryption] = encrypt_text(text.downcase.dup, key, date)
    results[:key] = key
    results[:date] = date
    results
  end

  def decrypt(text, key = random_key, date = today)
    results = Hash.new(0)
    results[:decryption] = decrypt_text(text.downcase.dup, key, date)
    results[:key] = key
    results[:date] = date
    results
  end

  def encrypt_text(text, key, date)
    @cipher.encrypt_slot(text, key, date, 0)
    @cipher.encrypt_slot(text, key, date, 1)
    @cipher.encrypt_slot(text, key, date, 2)
    @cipher.encrypt_slot(text, key, date, 3)
    text
  end

  def decrypt_text(text, key, date)
    @cipher.decrypt_slot(text, key, date, 0)
    @cipher.decrypt_slot(text, key, date, 1)
    @cipher.decrypt_slot(text, key, date, 2)
    @cipher.decrypt_slot(text, key, date, 3)
    text
  end

  def crack(cipher_text, date = @today)
    key_value = @cracker.find_key(cipher_text, date)
    decryption = decrypt_text(cipher_text, key_value, date)
    { decryption: decryption, date: date, key: key_value }
  end
end
