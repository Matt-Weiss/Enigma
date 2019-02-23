require './lib/encrypt_module'
require './lib/generator'

class Enigma
  attr_reader :final_shift
  include Generator
  include Encrypt

  def initialize(modifier = 1)
    @final_shift = nil
    @encryption_modifier = modifier
  end

  def encrypt(message, key = generate_key, date = todays_date)
    @encryption_modifier = 1
    {encryption: encrypt_shift(message, key, date).join,
     key: key,
     date: date}
  end

  def decrypt(message, key, date = todays_date)
    @encryption_modifier = -1
    {decryption: encrypt_shift(message, key, date).join,
     key: key,
     date: date}
  end

end
