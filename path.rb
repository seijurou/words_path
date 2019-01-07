require 'set'
require_relative 'node'

class Path
  
  attr_reader :nodes
  
  def initialize(dic_file_path, start_word, end_word)
    raise ArgumentError,
      'The start and the end word must have the same length' unless start_word.size == end_word.size
    
    @words = dic_words(dic_file_path, start_word.length)
    
    raise ArgumentError,
      'The start and the end word must be in the dictionary' unless @words.include?(start_word) && @words.include?(end_word)
      
      @nodes, @end_word, @visited = Array(Node.new(start_word, start_word, end_word)), end_word, Set.new
  end
  
  ## 
  # Backtracking search that uses some heuristic to get the next node to visit
  # References: A* algorithm (https://en.wikipedia.org/wiki/A*_search_algorithm)
  ##
  def build_path!
    return @nodes if searched_ended?
    mark_as_visited(@nodes.last.word)
    @nodes.last.find_neighbor(@words.subtract(@visited))
    mark_as_visited(@nodes.last.potential_neighbors)
    if @nodes.last.valid_neighbor?
      @nodes << @nodes.last.neighbor
    else
      @nodes.pop
    end
    build_path!
  end
  
  private
  
  def searched_ended?
    @nodes.empty? || @nodes.last.word == @end_word
  end
  
  def mark_as_visited(words)
    @visited.merge(Array(words))
  end
  
  def dic_words(file_path, length)
    ##print('insde dic_words: '+file_path+' '+length+' \end\n')
    ##gets.chomp
    words = Set.new
    File.open(file_path) do |file|
      file.each do |line|
        word = line.strip
        words.add(word.downcase) if word.length == length
      end
    end
    words
  end
end    