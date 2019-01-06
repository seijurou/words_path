class String
  
  ##
  # References: https://en.wikipedia.org/wiki/Hamming_distance
  ##
  def hamming_distance(word)
    raise ArgumentError, "Both strings have the same length" unless self.length == word.length
    self.chars.zip(word.chars).count {|char1, char2| char1 != char2 }
  end
end