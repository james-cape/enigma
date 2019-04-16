require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/cipher'
require 'date'

class CipherTest < Minitest::Test
  def test_cipher_exists
    cipher = Cipher.new

    expected = Cipher
    actual = cipher
    assert_instance_of expected, actual
  end

  def test_cipher_starts_with_raw_alphabet
    cipher = Cipher.new

    expected = ("a".."z").to_a << " "
    actual = cipher.alphabet
    assert_equal expected, actual

    # cipher = Cipher.new
    #
    # expected = ("a".."z").to_a << " "
    # actual = cipher.alphabet
    # assert_equal expected, actual
  end

  def test_cipher_extracts_last_four_from_date
    cipher = Cipher.new

    expected = "1025"
    actual = cipher.last_four("040895")
    assert_equal expected, actual
  end

  def test_cipher_creates_shifted_alphabet
    cipher = Cipher.new

    expected = ["d", "e", "f", "g", "h"]
    actual = cipher.shift("02715", "040895", 0)[0..4]
    assert_equal expected, actual
  end

  def test_cipher_encrypts_string_by_slot
    cipher = Cipher.new

    expected = "kellr would"
    actual = cipher.encrypt_slot("hello world", "02715", "040895", 0)
    assert_equal expected, actual
  end

  def test_cipher_decrypts_string_by_slot
    cipher = Cipher.new

    expected = "hello world"
    actual = cipher.decrypt_slot("kellr would", "02715", "040895", 0)
    assert_equal expected, actual
  end




end
