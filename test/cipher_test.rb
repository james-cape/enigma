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


end
