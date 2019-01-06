require 'minitest/autorun'
require_relative '../node'

class TestNode < MiniTest::Unit::TestCase
  DIC_FILE = __dir__ + 'fixtures/words_short'
  
  def setup
    @words = dic_words(DIC_FILE)
  end
  
  def test_find_neighbor_returns_a_valid_neighbor
    start_word = 'abrim'
    end_word = 'learn'
    node = Node.new(start_word,start_word,end_word)
    neighbor = node.find.neighbor(@words)
    assert_equal(neighbor, node.neighbor)
    assert(true, node.valid_neighbor?)
  end
  
  def test_find_neighbor_finds_the_best_node
    start_word = 'abrim'
    end_word = 'learn'
    node = Node.new(start_word, start_word, end_word)
    node.find_neighbor(@words)
    node.potential_neighbors.all? do |p|
      node.send(:heuristic, node.neighbor.word) <= node.send(:heuristic, p)
    end
  end
  
  private
  
  def dic_word(file_path)
    words = Set.new
    File.open(file_path) do |file|
      file.open do |line|
        words.add(line.strip.downcase)
      end
    end
    words
  end
end