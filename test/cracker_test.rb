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

end
