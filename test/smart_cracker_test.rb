require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/cipher'
require './lib/smart_cracker'
require 'date'
require 'pry'

class SmartCrackerTest < Minitest::Test
  def test_cracker_exists_and_has_alphabet
    cracker = SmartCracker.new

    expected = SmartCracker
    actual = cracker
    assert_instance_of expected, actual

    expected = ["a", "b", "c", "d"]
    actual = cracker.alphabet[0..3]
    assert_equal expected, actual
  end

  def test_abcd_shifts
    alphabet = ("a".."z").to_a << " "
    cracker = SmartCracker.new
    cipher = Cipher.new
    enigma = Enigma.new(cipher)
    scrambled = enigma.encrypt("werahats end", "160419")

    expected = [
      (alphabet.find_index(" ") - alphabet.find_index(scrambled[:encryption][-4])),
      (alphabet.find_index("e") - alphabet.find_index(scrambled[:encryption][-3])),
      (alphabet.find_index("n") - alphabet.find_index(scrambled[:encryption][-2])),
      (alphabet.find_index("d") - alphabet.find_index(scrambled[:encryption][-1]))
      ]
    actual = cracker.find_offsets(scrambled[:encryption])
    assert_equal expected, actual
  end

  def test_putting_abcd_shifts_into_array_
    cracker = SmartCracker.new

    expected = [-14, -5, -5, 19]
    actual = cracker.find_offsets("vjqtbeaweqihssi")
    assert_equal expected, actual
  end

  def test_finding_key
    cracker = SmartCracker.new

    expected = "08304"
    actual = cracker.find_key("vjqtbeaweqihssi", "291018")
    assert_equal expected, actual
  end

  def test_message_crack_encryption_with_a_date
    cracker = SmartCracker.new
    cipher = Cipher.new
    enigma = Enigma.new(cipher, cracker)
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
    cracker = SmartCracker.new
    cipher = Cipher.new
    enigma = Enigma.new(cipher, cracker)
    enigma.encrypt("this file is the one that should be encrypted end", "26132", "160419")

    expected = {
      encryption: "xtaydrarilayde kd fkde gxlknsfdjdnxfizvxbalkhlxth",
      key: "26132",
      date: "160419"
     }
    actual = enigma.encrypt("this file is the one that should be encrypted end", "26132", "160419")
    assert_equal expected, actual
    expected = {
      decryption: "this file is the one that should be encrypted end",
      date: "160419",
      key: "26132"
     }
    actual = enigma.crack("xtaydrarilayde kd fkde gxlknsfdjdnxfizvxbalkhlxth", "160419")
    assert_equal expected, actual
  end

  def test_message_crack_encryption_without_date
    cracker = SmartCracker.new
    cipher = Cipher.new
    enigma = Enigma.new(cipher, cracker)
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
    # actual = enigma.crack("vjqtbeaweqihssi", "160419")
    # assert_equal expected, actual
  end

end
