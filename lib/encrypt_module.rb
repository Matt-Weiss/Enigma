module Encrypt

  def encrypt_message(message, key, date)
    shifts(key, date)
    encryption = characters_to_encrypt(message).map do |char|
      check_valid_characters(char)
    end
    encryption
  end

  def characters_to_encrypt(message)
    characters = message.downcase.chars
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
      encrypt_shifts(char, :a)
    elsif char[1] % 4 == 1
      encrypt_shifts(char, :b)
    elsif char[1] % 4 == 2
      encrypt_shifts(char, :c)
    else
      encrypt_shifts(char, :d)
    end
  end

  def encrypt_shifts(char, shift)
    index = character_set.find_index(char[0])
    shift = @encryption_modifier * final_shift[shift]
    character_set.rotate(shift)[index]
  end
end
