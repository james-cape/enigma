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
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_encrypt_defaults_with_random_5_digit_key_and_todays_date
    enigma = Enigma.new

    expected = 5
    actual = enigma.encrypt("hello world")[:key].length
    assert_equal expected, actual

    expected = @today
    actual = enigma.encrypt("hello world")[:date]
    assert_equal expected, actual
  end

  def test_encrypting_text_with_user_input_key_and_date
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
     }
    actual = enigma.encrypt("hello world", "02715", "040895")
    assert_equal expected, actual
  end

  def test_decrypting_text_with_user_input_key_and_date
    enigma = Enigma.new

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
     }
    actual = enigma.decrypt("keder ohulw", "02715", "040895")
    assert_equal expected, actual
  end

  def test_encrypting_text_with_user_input_key_but_todays_date
    enigma = Enigma.new

    expected = {
      :encryption=>"ojhavesdyq ",
      :key=>"02715",
      :date=> @today
    }
    actual = enigma.encrypt("hello world", "02715")
    assert_equal expected, actual
  end

  def test_decrypting_text_with_user_input_key_and_todays_date
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715")
    expected = {
      :decryption=>"hello world",
      :key=>"02715",
      :date=> @today
    }
    actual = enigma.decrypt(encrypted[:encryption], "02715")
    assert_equal expected, actual
  end

  def test_decrypting_text_with_special_characters
    enigma = Enigma.new
    encrypted = enigma.encrypt("hel.lo wo$rld!", "02715")
    expected = {
      :decryption=>"hel.lo wo$rld!",
      :key=>"02715",
      :date=> @today
    }
    actual = enigma.decrypt(encrypted[:encryption], "02715")
    assert_equal expected, actual
  end

  def test_decrypting_text_with_capitalizations
    enigma = Enigma.new
    encrypted = enigma.encrypt("HELLO world", "02715")
    expected = {
      :decryption=>"hello world",
      :key=>"02715",
      :date=> @today
    }
    actual = enigma.decrypt(encrypted[:encryption], "02715")
    assert_equal expected, actual
  end

  def test_encrypting_text_with_random_key_and_todays_date
    enigma = Enigma.new

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

  def test_text_encryption
    enigma = Enigma.new

    expected = "wyybcmnrvtoacytlaizng"
    actual = enigma.encrypt_text("test this is encypted", "84332", "082398")
    assert_equal expected, actual
  end

  def test_text_decryption
    enigma = Enigma.new

    expected = "test this is encypted"
    actual = enigma.decrypt_text("wyybcmnrvtoacytlaizng", "84332", "082398")
    assert_equal expected, actual
  end

  def test_text_crack
    enigma = Enigma.new(Cracker.new)

    expected = {
      :decryption=>"hello world end",
      :date=>"291018",
      :key=>"08304"
    }
    actual = enigma.crack("vjqtbeaweqihssi", "291018")
    assert_equal expected, actual
  end

end
