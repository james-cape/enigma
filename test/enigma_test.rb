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

    # Possible spot for mock/stubs
    expected = "#{time.month}#{time.day}#{time.year}".rjust(8,"0")
    actual = enigma.encrypt("hello world")[:date]
    assert_equal expected, actual
  end

  def test_encrypting_message
    enigma = Enigma.new
    time = Time.new

    expected = 5
    actual = enigma.encrypt("hello world")
    assert_equal expected, actual
  end


end
