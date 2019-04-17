require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cracker'
require './lib/cipher'
require './lib/shifter'
require './lib/enigma'

class CrackerTest < Minitest::Test
  attr_reader :cipher

  def setup
    @cipher = Cipher.new
  end

  def test_cracker_exists
    cracker = Cracker.new

    expected = Cracker
    actual = cracker
    assert_instance_of expected, actual
  end

  def test_cracker_has_keys
    cracker = Cracker.new

    expected = 100000
    actual = cracker.keys.length
    assert_equal expected, actual
  end

  def test_brute_force_find_key_technique
    cracker = Cracker.new

    expected = "08304"
    actual = cracker.find_key("vjqtbeaweqihssi", "291018")
    assert_equal expected, actual
  end

  # def test_brute_force_find_key_technique_without_date
  #   cracker = Cracker.new
  #
  #   expected = "08304"
  #   actual = cracker.find_key("vjqtbeaweqihssi")
  #   assert_equal expected, actual
  # end
end
