require './lib/encrypt_module'
require './lib/generator'

class Enigma
  include Generator
  include Encrypt

  def initialize
  end

  def encrypt(message, key = generate_key, date = todays_date)
    {encryption: encrypt_shift(message, key, date).join,
     key: key,
     date: date}
  end

end
