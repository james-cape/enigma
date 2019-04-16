require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/cipher'
require 'date'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_enigma_exists
    cipher = Cipher.new
    enigma = Enigma.new(cipher)
    assert_instance_of Enigma, enigma
  end

  def test_encrypt_defaults_with_random_5_digit_key_and_todays_date
    cipher = Cipher.new
    enigma = Enigma.new(cipher)
    # time = Time.new

    expected = 5
    actual = enigma.encrypt("hello world")[:key].length
    assert_equal expected, actual

    expected = "150419"
    actual = enigma.encrypt("hello world")[:date]
    assert_equal expected, actual
  end

  def test_encrypting_message_with_user_input_key_and_date
    cipher = Cipher.new
    enigma = Enigma.new(cipher)

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
     }
    actual = enigma.encrypt("hello world", "02715", "040895")
    assert_equal expected, actual
  end

  def test_encrypting_message_with_user_input_key_but_todays_date
    cipher = Cipher.new
    enigma = Enigma.new(cipher)

    expected = {
      :encryption=>"ojhavesdyq ",
      :key=>"02715",
      :date=>"150419"
    }
    actual = enigma.encrypt("hello world", "02715")
    assert_equal expected, actual
  end

  def test_decrypting_message_with_user_input_key_and_todays_date
    cipher = Cipher.new
    enigma = Enigma.new(cipher)
    encrypted = enigma.encrypt("hello world", "02715")
    expected = {
      :decryption=>"hello world",
      :key=>"02715",
      :date=>"150419"
    }
    actual = enigma.decrypt(encrypted[:encryption], "02715")
    assert_equal expected, actual
  end

  def test_encrypting_message_with_random_key_and_todays_date
    cipher = Cipher.new
    enigma = Enigma.new(cipher)

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
    cipher = Cipher.new
    enigma = Enigma.new(cipher)

    expected = "wyybcmnrvtoacytlaizng"
    actual = enigma.encrypt_full_message("test this is encypted", "84332", "082398")
    assert_equal expected, actual
  end

  def test_message_decryption
    cipher = Cipher.new
    enigma = Enigma.new(cipher)

    expected = "test this is encypted"
    actual = enigma.decrypt_full_message("wyybcmnrvtoacytlaizng", "84332", "082398")
    assert_equal expected, actual
  end







  def test_putting_abcd_shifts_into_array
    cipher = Cipher.new
    enigma = Enigma.new(cipher)

    expected = [-14, -5, -5, 19]
    actual = enigma.find_offsets("vjqtbeaweqihssi")
    assert_equal expected, actual
  end

  def test_finding_key
    cipher = Cipher.new
    enigma = Enigma.new(cipher)

    expected = "08304"
    actual = enigma.find_key("vjqtbeaweqihssi", "291018")
    assert_equal expected, actual
  end

  def test_message_crack_encryption_with_a_date
    cipher = Cipher.new
    enigma = Enigma.new(cipher)
    enigma.encrypt("hello world end", "08304", "291018")

    expected = {
      encryption: "vjqtbeaweqihssi",
      key: "08304",
      date: "291018"
     }
    actual = enigma.encrypt("hello world end", "08304", "291018")
    assert_equal expected, actual
    expected = {
      decryption: "hello world end",
      date: "291018",
      key: "08304"
     }
    actual = enigma.crack("vjqtbeaweqihssi", "291018")
    assert_equal expected, actual
  end

  def test_message_crack_encryption_with_a_date_and_different_string
    cipher = Cipher.new
    enigma = Enigma.new(cipher)
    enigma.encrypt("this file is the one that should be encrypted end", "26132", "150419")

    expected = {
      encryption: "xtaydrarilayde kd fkde gxlknsfdjdnxfizvxbalkhlxth",
      key: "26132",
      date: "150419"
     }
    actual = enigma.encrypt("this file is the one that should be encrypted end", "26132", "150419")
    assert_equal expected, actual
    expected = {
      decryption: "this file is the one that should be encrypted end",
      date: "150419",
      key: "26132"
     }
    actual = enigma.crack("xtaydrarilayde kd fkde gxlknsfdjdnxfizvxbalkhlxth", "150419")
    assert_equal expected, actual
  end



  def test_message_crack_encryption_without_date
    
    cipher = Cipher.new
    enigma = Enigma.new(cipher)
    enigma.encrypt("hello world end", "08304", "291018")

    expected = {
      encryption: "vjqtbeaweqihssi",
      key: "08304",
      date: "291018"
     }
    actual = enigma.encrypt("hello world end", "08304", "291018")
    assert_equal expected, actual

    expected = {
      decryption: "hello world end",
      date: "# todays date in the format DDMMYY",
      key: "# key used for encryption"
     }
    actual = enigma.crack("vjqtbeaweqihssi")
    assert_equal expected, actual
  end

end
