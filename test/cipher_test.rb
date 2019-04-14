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


end
