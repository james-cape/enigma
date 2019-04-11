require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require 'date'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_enigma_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_encrypt_defaults_with_random_5_digit_key_and_todays_date
    enigma = Enigma.new
    time = Time.new

    expected = 5
    actual = enigma.encrypt("hello world")[:key].length
    assert_equal expected, actual

    expected = "#{time.month}#{time.day}#{time.year}".rjust(8,"0")
    actual = enigma.encrypt("hello world")[:date]
    assert_equal expected, actual
  end

  def test_encrypting_message_and_outputting_hash
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
     }
    actual = enigma.encrypt("hello world", "02715", "040895")
    assert_equal expected, actual
  end

  def test_a_shift_generates_shifted_alphabet
    enigma = Enigma.new

    expected = ["h", "i", "j", "k", "l"]
    actual = enigma.a_shift("53889", "03122012")[0..4]
    assert_equal expected, actual
  end

  def test_date_converted_to_four_digit_key
    enigma = Enigma.new

    expected = "2009"
    actual = enigma.last_four("04272003")
    assert_equal expected, actual
  end

  def test_message_encryption
    enigma = Enigma.new

    expected = "yuybeinrxpoaeutlcezni"
    actual = enigma.encrypt_message("test this is encypted", "84332", "08231998")
    assert_equal expected, actual
  end

  def test_message_decryption
    enigma = Enigma.new

    expected = "test this is encypted"
    actual = enigma.decrypt_message("yuybeinrxpoaeutlcezni", "84332", "08231998")
    assert_equal expected, actual
  end

end
