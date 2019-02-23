require './test/test_helper'

class EncryptTest < Minitest::Test

  def test_can_slice_message_into_components
    enigma = Enigma.new
    expected = [["h", 0], ["e", 1], ["l", 2], ["l", 3], ["o", 4]]
    assert_equal expected, enigma.characters_to_encrypt("hello")
  end

  def test_apply_a_shift
    enigma = Enigma.new
    assert_equal ["k"], enigma.encrypt_shift("h", "02715", "040895")
  end

  def test_apply_all_shifts
    enigma = Enigma.new
    expected = ["k", "e", "d", "e", "r"]
    assert_equal expected, enigma.encrypt_shift("hello", "02715", "040895")
  end

  def test_special_characters_pass_through
    enigma = Enigma.new
    expected = ["k", "e", "d", "e", "r", "!"]
    assert_equal expected, enigma.encrypt_shift("hello!", "02715", "040895")
  end
end
