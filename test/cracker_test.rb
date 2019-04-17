require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cracker'

class CrackerTest < Minitest::Test

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

  def test_brute_force_technique
    cracker = Cracker.new

    expected = "08304"
    actual = cracker.brute_force("vjqtbeaweqihssi", "291018")
    assert_equal expected, actual
  end
end
