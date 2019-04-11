require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_enigma_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end


end
