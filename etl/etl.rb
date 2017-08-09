# Transforms dictionary of Score => Letters, to Letter => Score
module ETL
  def self.transform(input)
    input.each_with_object({}) do |score_definition, result|
      score, letters = score_definition
      letters.each do |letter|
        result[letter.downcase] = score
      end
      result
    end
  end
end

module BookKeeping
  VERSION = 1
end
