require './test/test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_shift_starts_nil
    enigma = Enigma.new
    assert_nil enigma.final_shift
  end

  def test_we_can_create_shifts_and_access_via_method
    enigma = Enigma.new
    enigma.shifts("02715", "040895")
    expected = {:a=>3, :b=>27, :c=>73, :d=>20}
    assert_equal expected, enigma.final_shift
  end

  def test_can_encrypt_and_join
    enigma = Enigma.new
    assert_equal "keder ohulw", enigma.encrypt_message("hello world", "02715", "040895").join
  end

  def test_encryption_with_key_and_date
    enigma = Enigma.new
    expected = {encryption: "keder ohulw",
                key: "02715",
                date: "040895"}
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_decryption_with_key_and_date
    enigma = Enigma.new
    expected = {decryption: "hello world",
                key: "02715",
                date: "040895"}
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_can_encrypt_and_decrypt_with_todays_date
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715")
    expected = {:decryption=>"hello world",
                :key=>"02715",
                :date=>"270219"}
    assert_equal expected, enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_can_encrypt_and_decrypt_with_only_message
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world")
    decrypted = enigma.decrypt(encrypted[:encryption], encrypted[:key])
    assert_equal "hello world", decrypted[:decryption]
  end

  def test_crack
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world end")
    cracked = enigma.crack(encrypted[:encryption])
    assert_equal "hello world end", cracked[:decryption]
  end
end
