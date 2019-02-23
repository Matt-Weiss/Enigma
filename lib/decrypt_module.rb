module Decrypt

  def decrypt_shift(message, key, date)
    shifts(key, date)
    encryption = characters_to_decrypt(message).map do |char|
      check_valid_characters(char)
    end
    encryption
  end

  def characters_to_decrypt(message)
    characters = message.chars
    message_with_indices = characters.map.with_index do |char, index|
      [char, index]
    end
    message_with_indices
  end

  def check_valid_characters(char)
    if character_set.include?(char[0])
      decide_decrypt_shifts(char)
    else
      char[0]
    end
  end

  def decide_decrypt_shifts(char)
    if char[1] % 4 == 0
      decrypt_a_shift(char)
    elsif char[1] % 4 == 1
      decrypt_b_shift(char)
    elsif char[1] % 4 == 2
      decrypt_c_shift(char)
    else
      decrypt_d_shift(char)
    end
  end

  def decrypt_a_shift(char)
      index = character_set.find_index(char[0])
      character_set.rotate(-@final_shift[:a])[index]
  end

  def decrypt_b_shift(char)
      index = character_set.find_index(char[0])
      character_set.rotate(-@final_shift[:b])[index]
  end

  def decrypt_c_shift(char)
    index = character_set.find_index(char[0])
    character_set.rotate(-@final_shift[:c])[index]
  end

  def decrypt_d_shift(char)
    index = character_set.find_index(char[0])
    character_set.rotate(-@final_shift[:d])[index]
  end
end
