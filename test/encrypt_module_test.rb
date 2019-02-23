require './test/test_helper'

class EncryptTest < Minitest::Test

  def test_can_slice_message_into_components
    enigma = Enigma.new
    expected = [["h", 0], ["e", 1], ["l", 2], ["l", 3], ["o", 4]]
    assert_equal expected, enigma.characters("hello")
  end

  def test_apply_one_shift
    enigma = Enigma.new
    # binding.pry
    assert_equal ["k"], enigma.apply_shift("h", "02715", "040895")
  end



end
