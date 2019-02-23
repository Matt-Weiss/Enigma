module Encrypt
# %4
  def characters(message)
    characters = message.chars
    message_with_indices = characters.map.with_index do |char, index|
      [char, index]
    end
    message_with_indices
  end

  def apply_shift(message, key, date)
    shifts(key, date)
    encryption = characters(message).map do |char|
      a_shift(char[0])
    end
    encryption
  end

  def a_shift(char)
    # binding.pry
    index = character_set.find_index(char)
    character_set.rotate(@final_shift[:a])[index]
  end


end
