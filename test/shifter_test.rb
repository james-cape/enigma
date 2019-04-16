require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shifter'

class ShifterTest < Minitest::Test

  def test_shifter_exists
    shifter = Shifter.new("12345", "140419", 1)

    expected = Shifter
    actual = shifter
    assert_instance_of expected, actual
  end

  def test_shifter_has_attributes
    shifter = Shifter.new("12345", "140419", 1)

    expected = "12345"
    actual = shifter.key
    assert_equal expected, actual

    expected = "140419"
    actual = shifter.date
    assert_equal expected, actual

    expected = 1
    actual = shifter.slot
    assert_equal expected, actual
  end

  def test_last_four_of_square_of_date
    shifter = Shifter.new("12345", "140419", 1)

    expected = "5561"
    actual = shifter.last_four("140419")
    assert_equal expected, actual
  end

  def test_shift_alphabet_is_generated
    shifter = Shifter.new("12345", "140419", 5)

    expected = ["a", "b", "c", "d", "e"]
    actual = shifter.shift("12345", "140419", 5)[0..4]
    assert_equal expected, actual
  end


end
