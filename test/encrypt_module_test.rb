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

  def test_can_slice_message_into_components
    enigma = Enigma.new
    expected = [["k", 0], ["e", 1], ["d", 2], ["e", 3], ["r", 4]]
    assert_equal expected, enigma.characters_to_encrypt("keder")
  end

  def test_apply_a_decrypt_shift
    enigma = Enigma.new(-1)
    assert_equal ["h"], enigma.encrypt_shift("k", "02715", "040895")
  end

  def test_apply_all_decrypt_shifts
    enigma = Enigma.new(-1)
    expected = ["h", "e", "l", "l", "o"]
    assert_equal expected, enigma.encrypt_shift("keder", "02715", "040895")
  end

  def test_special_characters_pass_through_decrypt
    enigma = Enigma.new(-1)
    expected = ["h", "e", "l", "l", "o", "!"]
    assert_equal expected, enigma.encrypt_shift("keder!", "02715", "040895")
  end
end
