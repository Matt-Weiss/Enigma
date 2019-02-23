require './test/test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_can_encrypt_hello
    skip
    enigma = Enigma.new
    assert_equal "keder", enigma.encrypt("hello", "02715", "040895")
  end

  def test_encryption_with_key_and_date
    skip
    enigma = Enigma.new
    expected = {encryption: "keder ohulw",
                key: "02715",
                date: "040895"}
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

end
