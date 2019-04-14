require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/cipher'
require 'date'
require 'pry'

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
    actual = cipher.raw_alphabet
    assert_equal expected, actual
  end

  def test_cipher_starts_with_raw_alphabet
    cipher = Cipher.new

    expected = ("a".."z").to_a << " "
    actual = cipher.raw_alphabet
    assert_equal expected, actual
  end

  def test_cipher_extracts_last_four_from_date
    cipher = Cipher.new

    expected = "5561"
    actual = cipher.last_four("130419")
    assert_equal expected, actual
  end

  def test_cipher_creates_shifted_alphabet
    cipher = Cipher.new

    expected = ["k", "l", "m", "n", "o"]
    actual = cipher.shift("05354", "130419", 0)[0..4]
    assert_equal expected, actual
  end

  # def test_cipher_transforms_message
  #   cipher = Cipher.new
  #   # message = "tryout"
  #   # key = 06590
  #   # date = 130419
  #
  #   expected = "asb"
  #   actual = cipher.encrypt_shift("tryout", "05643", "130419", 0)
  #   assert_equal expected, actual
  # end




end
