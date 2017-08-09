module RunLengthEncoding
  def self.encode message
    encode_set count_chars message
  end

  def self.count_chars message
    message.chars.inject([]) do |encoded_message, letter|
      if encoded_message.last && letter == encoded_message.last[0]
        encoded_message.last[1] += 1
      else
        encoded_message << [letter, 1]
      end
      encoded_message
    end
  end

  def self.encode_set set
    set.inject('') do |response, run|
      if run[1] < 2
        response += run[0].to_s
      else
        response += run[1].to_s + run[0]
      end
    end
  end

  def self.decode message
    number = ''
    message.chars.inject('') do |response, subject| 
      if subject.to_i > 0
        number += subject
      else
        response += (number.to_i > 0 ? subject * number.to_i : subject)
        number = ''
      end
      response
    end
  end
end

module BookKeeping
  VERSION = 3
end
