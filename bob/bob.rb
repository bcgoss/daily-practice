module Bob
  def self.hey(remark)
    if remark =~ /\A\s*\Z/
      answer_silence
    elsif remark == remark.upcase && remark.upcase != remark.downcase
      urge_calm
    elsif remark =~ /\?\Z/
      answer_question
    else
      normal_reply
    end
  end

  def self.answer_silence
    'Fine. Be that way!'
  end

  def self.answer_question
    'Sure.'
  end

  def self.urge_calm
    'Whoa, chill out!'
  end

  def self.normal_reply
    'Whatever.'
  end
end
