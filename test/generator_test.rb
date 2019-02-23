require './test/test_helper'

class GeneratorTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_we_can_generate_a_key
    @enigma.generate_key
    assert_equal 5, @enigma.generate_key.length
  end

  def test_we_can_get_todays_date
    assert_equal "230219", @enigma.todays_date
  end

  def test_seperate_keys
    expected = {a: 02,b: 27,c: 71,d: 15}

    assert_equal expected, @enigma.keys("02715")
  end

  def test_generate_offsets
    expected = {a: 1,b: 0,c: 2,d: 5}

    assert_equal expected, @enigma.offsets("040895")
  end

  def test_generate_shifts
    expected = {a: 3, b: 27, c: 73, d:20}

    assert_equal expected, @enigma.shifts("02715", "040895")
  end

  def test_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                " "]
    assert_equal expected, @enigma.character_set
  end

end
