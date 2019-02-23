require './test/test_helper'

class DecryptTest < Minitest::Test

  def test_can_slice_message_into_components
    enigma = Enigma.new
    expected = [["k", 0], ["e", 1], ["d", 2], ["e", 3], ["r", 4]]
    assert_equal expected, enigma.characters_to_decrypt("keder")
  end

  def test_apply_a_shift
    skip
    enigma = Enigma.new
    assert_equal ["h"], enigma.decrypt_shift("k", "02715", "040895")
  end

  def test_apply_all_shifts
    skip
    enigma = Enigma.new
    expected = ["h", "e", "l", "l", "o"]
    assert_equal expected, enigma.decrypt_shift("keder", "02715", "040895")
  end

  def test_special_characters_pass_through
    skip
    enigma = Enigma.new
    expected = ["h", "e", "l", "l", "o", "!"]
    assert_equal expected, enigma.decrypt_shift("keder!", "02715", "040895")
  end
end
