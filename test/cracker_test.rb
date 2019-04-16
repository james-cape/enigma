require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/cipher'
require './lib/cracker'
require 'date'
require 'pry'

class CrackerTest < Minitest::Test

  def test_cracker_exists
    cracker = Cracker.new

    expected = Cracker
    actual = cracker
    assert_instance_of expected, actual

  end
  #
  # def test_putting_abcd_shifts_into_array
  #   cipher = Cipher.new
  #   enigma = Enigma.new(cipher)
  #
  #   expected = [-14, -5, -5, 19]
  #   actual = enigma.find_offsets("vjqtbeaweqihssi")
  #   assert_equal expected, actual
  # end
  #
  # def test_finding_key
  #   cipher = Cipher.new
  #   enigma = Enigma.new(cipher)
  #
  #   expected = "08304"
  #   actual = enigma.find_key("vjqtbeaweqihssi", "291018")
  #   assert_equal expected, actual
  # end
  #
  # def test_message_crack_encryption_with_a_date
  #   cipher = Cipher.new
  #   enigma = Enigma.new(cipher)
  #   enigma.encrypt("hello world end", "08304", "291018")
  #
  #   expected = {
  #     encryption: "vjqtbeaweqihssi",
  #     key: "08304",
  #     date: "291018"
  #    }
  #   actual = enigma.encrypt("hello world end", "08304", "291018")
  #   assert_equal expected, actual
  #   expected = {
  #     decryption: "hello world end",
  #     date: "291018",
  #     key: "08304"
  #    }
  #   actual = enigma.crack("vjqtbeaweqihssi", "291018")
  #   assert_equal expected, actual
  # end
  #
  # def test_message_crack_encryption_with_a_date_and_different_string
  #   cipher = Cipher.new
  #   enigma = Enigma.new(cipher)
  #   enigma.encrypt("this file is the one that should be encrypted end", "26132", "150419")
  #
  #   expected = {
  #     encryption: "xtaydrarilayde kd fkde gxlknsfdjdnxfizvxbalkhlxth",
  #     key: "26132",
  #     date: "150419"
  #    }
  #   actual = enigma.encrypt("this file is the one that should be encrypted end", "26132", "150419")
  #   assert_equal expected, actual
  #   expected = {
  #     decryption: "this file is the one that should be encrypted end",
  #     date: "150419",
  #     key: "26132"
  #    }
  #   actual = enigma.crack("xtaydrarilayde kd fkde gxlknsfdjdnxfizvxbalkhlxth", "150419")
  #   assert_equal expected, actual
  # end
  #


  def test_message_crack_encryption_without_date
skip
    cipher = Cipher.new
    enigma = Enigma.new(cipher)
    enigma.encrypt("hello world end", "08304", "291018")

    # expected = {
    #   encryption: "vjqtbeaweqihssi",
    #   key: "08304",
    #   date: "291018"
    #  }
    # actual = enigma.encrypt("hello world end", "08304", "291018")
    # assert_equal expected, actual

    expected = {
      decryption: "hello world end",
      date: "# todays date in the format DDMMYY",
      key: "# key used for encryption"
     }
    actual = enigma.crack("vjqtbeaweqihssi", "160419")
    assert_equal expected, actual
  end

end
