module Encrypt

  def apply_shift(message, key, date)
    shifts(key, date)
    encryption = characters(message).map do |char|
      if character_set.include?(char[0])
        decide_shifts(char)
      else
        char[0]
      end
    end
    encryption
  end

  def characters(message)
    characters = message.chars
    message_with_indices = characters.map.with_index do |char, index|
      [char, index]
    end
    message_with_indices
  end
  
  def decide_shifts(char)
    if char[1] % 4 == 0
      a_shift(char)
    elsif char[1] % 4 == 1
      b_shift(char)
    elsif char[1] % 4 == 2
      c_shift(char)
    elsif char[1] % 4 == 3
      d_shift(char)
    end
  end

  def a_shift(char)
      index = character_set.find_index(char[0])
      character_set.rotate(@final_shift[:a])[index]
  end

  def b_shift(char)
      index = character_set.find_index(char[0])
      character_set.rotate(@final_shift[:b])[index]
  end

  def c_shift(char)
    index = character_set.find_index(char[0])
    character_set.rotate(@final_shift[:c])[index]
  end

  def d_shift(char)
    index = character_set.find_index(char[0])
    character_set.rotate(@final_shift[:d])[index]
  end


end
