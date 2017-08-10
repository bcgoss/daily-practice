class Crypto
  def initialize(clear_text)
    @clear_text = clear_text
  end

  def normalize_plaintext
    @clear_text.downcase.gsub(/[^a-z0-9]/, '')
  end

  def size
    (normalize_plaintext.size ** (0.5)).ceil
  end

  def plaintext_segments
    char_matrix.map(&:join)
  end

  def ciphertext
    char_matrix.transpose.join
  end

  def normalize_ciphertext
    char_matrix.transpose.map(&:join).join(' ')
  end

  private

  def char_matrix
    pad(normalize_plaintext.chars.each_slice(size).map {|row| row })
  end

  def pad(matrix)
    target = matrix[0].length
    until matrix[-1].length == target
      matrix[-1] << ''
    end
    matrix
  end
end

module BookKeeping
  VERSION = 1
end
