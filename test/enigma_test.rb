require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/shifter'
require './lib/enigma'
require './lib/cipher'
require 'date'
require 'pry'

class EnigmaTest < Minitest::Test
  attr_reader :cipher

  def setup
    @cipher = Cipher.new
    @today = Time.now.strftime("%d%m%y")
  end

  def test_enigma_exists
    enigma = Enigma.new(cipher)
    assert_instance_of Enigma, enigma
  end

  def test_encrypt_defaults_with_random_5_digit_key_and_todays_date
    enigma = Enigma.new(cipher)

    expected = 5
    actual = enigma.encrypt("hello world")[:key].length
    assert_equal expected, actual

    expected = @today
    actual = enigma.encrypt("hello world")[:date]
    assert_equal expected, actual
  end

  def test_encrypting_message_with_user_input_key_and_date
    cracker = mock(cracker)
    enigma = Enigma.new(cipher, cracker)

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
     }
    actual = enigma.encrypt("hello world", "02715", "040895")
    assert_equal expected, actual
  end

  def test_encrypting_message_with_user_input_key_but_todays_date
    cracker = mock(cracker)
    enigma = Enigma.new(cipher, cracker)

    expected = {
      :encryption=>"ojhavesdyq ",
      :key=>"02715",
      :date=> @today
    }
    actual = enigma.encrypt("hello world", "02715")
    assert_equal expected, actual
  end

  def test_decrypting_message_with_user_input_key_and_todays_date
    cracker = mock(cracker)
    enigma = Enigma.new(cipher, cracker)
    encrypted = enigma.encrypt("hello world", "02715")
    expected = {
      :decryption=>"hello world",
      :key=>"02715",
      :date=> @today
    }
    actual = enigma.decrypt(encrypted[:encryption], "02715")
    assert_equal expected, actual
  end

  def test_encrypting_message_with_random_key_and_todays_date
    cracker = mock(cracker)
    enigma = Enigma.new(cipher, cracker)

    expected = 11
    actual = enigma.encrypt("hello world")[:encryption].length
    assert_equal expected, actual

    expected = "hello world"
    actual = enigma.encrypt("hello world")[:encryption]
    refute_equal expected, actual

    expected = 5
    actual = enigma.encrypt("hello world")[:key].length
    assert_equal expected, actual

    expected = 6
    actual = enigma.encrypt("hello world")[:date].length
    assert_equal expected, actual
  end

  def test_message_encryption
    enigma = Enigma.new(cipher)

    expected = "wyybcmnrvtoacytlaizng"
    actual = enigma.encrypt_full_message("test this is encypted", "84332", "082398")
    assert_equal expected, actual
  end

  def test_message_decryption
    enigma = Enigma.new(cipher)

    expected = "test this is encypted"
    actual = enigma.decrypt_full_message("wyybcmnrvtoacytlaizng", "84332", "082398")
    assert_equal expected, actual
  end

end
