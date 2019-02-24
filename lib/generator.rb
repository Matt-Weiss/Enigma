require 'date'

module Generator

  def generate_key
    key_array = (0..99999).to_a
    key = key_array.sample.to_s
    key.rjust(5)
  end

  def todays_date
    date = Date.today
    date.strftime("%d%m%y")
  end

  def keys(key)
    keys = {}
    keys[:a] = key.slice(0,2).to_i
    keys[:b] = key.slice(1,2).to_i
    keys[:c] = key.slice(2,2).to_i
    keys[:d] = key.slice(3,2).to_i
    keys
  end

  def offsets(date)
    offsets = {}
    offset_array = (date.to_i ** 2).digits.slice(0,4)
    offsets[:a] = offset_array[3]
    offsets[:b] = offset_array[2]
    offsets[:c] = offset_array[1]
    offsets[:d] = offset_array[0]
    offsets
  end

  def shifts(key, date)
    @final_shift = keys(key).merge(offsets(date)) {|hash_key, keys, shifts|
      keys + shifts }
  end

  def character_set
    characters = ("a".."z").to_a << " "
  end

end
