class Crypto
  def initialize(clear_text)
    @clear_text = clear_text
  end

  def normalize_plaintext
    @clear_text.downcase.gsub(/[^a-z0-9]/, '')
  end

  def size
    normalize_plaintext.size ** (0.5)
  end
end

module BookKeeping
  VERSION = 1
end
