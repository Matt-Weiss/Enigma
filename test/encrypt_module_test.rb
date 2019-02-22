require './test/test_helper'

class EncryptTest < Minitest::Test

  def test_we_can_generate_a_key
    enigma = Enigma.new
    enigma.generate_key
    assert_equal 5, enigma.generate_key.length
  end

  def test_we_can_get_todays_date
    enigma = Enigma.new
    assert_equal "220219", enigma.todays_date
  end
end
