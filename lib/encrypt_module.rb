module Encrypt

  def encrypt_shift(message, key, date)
    shifts(key, date)
    encryption = characters_to_encrypt(message).map do |char|
      check_valid_characters(char)
    end
    encryption
  end

  def characters_to_encrypt(message)
    characters = message.chars
    message_with_indices = characters.map.with_index do |char, index|
      [char, index]
    end
    message_with_indices
  end

  def check_valid_characters(char)
    if character_set.include?(char[0])
      decide_encrypt_shifts(char)
    else
      char[0]
    end
  end

  def decide_encrypt_shifts(char)
    if char[1] % 4 == 0
      encrypt_a_shift(char)
    elsif char[1] % 4 == 1
      encrypt_b_shift(char)
    elsif char[1] % 4 == 2
      encrypt_c_shift(char)
    else
      encrypt_d_shift(char)
    end
  end

  def encrypt_a_shift(char)
    index = character_set.find_index(char[0])
    shift = @encryption_modifier * final_shift[:a]
    character_set.rotate(shift)[index]
  end

  def encrypt_b_shift(char)
    index = character_set.find_index(char[0])
    shift = @encryption_modifier * final_shift[:b]
    character_set.rotate(shift)[index]
  end

  def encrypt_c_shift(char)
    index = character_set.find_index(char[0])
    shift = @encryption_modifier * final_shift[:c]
    character_set.rotate(shift)[index]
  end

  def encrypt_d_shift(char)
    index = character_set.find_index(char[0])
    shift = @encryption_modifier * final_shift[:d]
    character_set.rotate(shift)[index]
  end
end
