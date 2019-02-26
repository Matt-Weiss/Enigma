module Crack

  def find_key

  end

  def find_shift_1(message)
    key_character = message[-4]
    (26 - character_set.find_index(key_character))
  end

  def find_shift_2(message)
    key_character = message[-3]
    (4 - character_set.find_index(key_character))
  end

  def find_shift_3(message)
    key_character = message[-2]
    (13 - character_set.find_index(key_character))
  end

  def find_shift_4(message)
    key_character = message[-1]
    (3 - character_set.find_index(key_character))
  end

  def crack_shifts(message)
    shift = {}
    shift[:a] = find_shift_1(message)
    shift[:b] = find_shift_2(message)
    shift[:c] = find_shift_3(message)
    shift[:d] = find_shift_4(message)
    shift
  end

  def shifts_minus_offsets(message, date)
    crack_shifts(message).merge(offsets(date)) do |hash_key, shift, offset|
      shift - offset
    end
  end

end
