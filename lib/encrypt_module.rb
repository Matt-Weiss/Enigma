module Encrypt

  def generate_key
    key_array = (0..99999).to_a
    key = key_array.sample.to_s
    key.rjust(5)
  end

  def todays_date
    date = Date.today
    date.strftime("%d%m%y")
  end

end
