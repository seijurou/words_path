require 'set'
require_relative 'hamming'

class Node
  attr_reader :neighbor, :word, :potential_neighbors
  
  def initialize(word, start_word, end_word)
    @word, @start_word, @end_word, @neighbor, @potential_neighbors = word, start_word, end_word, nil, nil
  end
  
  ##
  # Returns the best next neighbor Node according to the heuristic 
  ##
  def find_neighbor(words)
    @potential_neighbors ||= get_potential_neighbors(words)
    @neighbor = @potential_neighbors.empty? ? nil : Node.new(@potential_neighbors.shift, @start_word, @end_word)
  end
  
  def valid_neighbor?
    !@neighbor.nil?
  end
  
  def to_s
    @word
  end
  
  private
  
  def get_potential_neighbors(words)
    potential = words.select { |w| @word.hamming_distance(w) == 1 }
    potential.sort_by { |w| heuristic(w) } unless potential.nil?
  end
  
  def heuristic(word)
    word.hamming_distance(@start_word) + word.hamming_distance(@end_word)
  end
end