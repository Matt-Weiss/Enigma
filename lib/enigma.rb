require './lib/encrypt_module'
require './lib/generator'

class Enigma
  attr_reader :final_shift
  include Generator
  include Encrypt

  def initialize(modifier = 1) #This is for decrypt unit testing purposes.
    @final_shift = nil
    @encryption_modifier = modifier
  end

  def encrypt(message, key = generate_key, date = todays_date)
    @encryption_modifier = 1
    {encryption: encrypt_message(message, key, date).join,
     key: key,
     date: date}
  end

  def decrypt(message, key, date = todays_date)
    @encryption_modifier = -1
    {decryption: encrypt_message(message, key, date).join,
     key: key,
     date: date}
  end

  def crack(message, date = todays_date)
    key = 0
    decrypted = {decryption: "nope"}
    until decrypted[:decryption].slice(-4, 4) == " end"
      decrypted = decrypt(message, key.to_s.rjust(5, "0"), date)
      key +=1
    end
    decrypted
  end

end
