# Strip punctuation and country code from phone number
module PhoneNumber
  def self.clean(input_number)
    number = input_number.gsub(/\D/, '')
    match = number.match(/\A1?[2-9]\d\d[2-9]\d{6}\z/).to_s
    valid_number?(match) ? match[-10..-1] : nil
  end

  def self.valid_number?(number)
    number.length == 10 || number.length == 11 && number.chars[0] == '1'
  end
end

module BookKeeping
  VERSION = 2
end
