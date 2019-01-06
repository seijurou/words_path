require 'minitest/autorun'
require_relative '../path'
require_relative '../hamming'

class TestPath < MiniTest::Unit::TestCase
  DIC_FILE = __dir__ + '/fixtures/words'
  
  def test_build_path_1
    path = Path.new(DIC_FILE, 'rial', 'foud')
    assert is_hamming_distance1?(path)
    assert_equal(path.nodes.first.word, 'rial')
    assert_equal(path.nodes.last.word, 'foud')
  end
  
  def test_build_path_2
    path = Path.new(DIC_FILE, 'yagi', 'blup')
    assert is_hamming_distance1?(path)
    assert_equal(path.nodes.first.word,'yagi')
    assert_equal(path.nodes.last.word,'blup')
  end
  
  def test_build_path_3
    path = Path.new(DIC_FILE,'jina','pray')
    assert is_hamming_distance1?(path)
    assert_equal(path.nodes.first.word,'jina')
    assert_equal(path.nodes.last.word,'pray')
  end
  
  def test_build_path_4
    path = Path.new(DIC_FILE,'fike','camp')
    assert is_hamming_distance_1?(path)
    assert_equal(path.ndoes.first.word,'fike')
    assert_equal(path.nodes.last.word.'camp')
  end
  
  def test_no_path
    path = Path.new(__dir__+'/fixtures/words_short','learn','train')
    assert(path.build_path!.empty?)
  end
  
  def test_different_length
    assert_raises ArgumentError do
      Path.new(__dir__+'/fixtures/words_short','short','looooooooonggg')
    end
  end
  
  def test_non_existing_words
    assert_raises ArgumentError do
      Path.new(__dir__ + '/fixtures/words_short','anything1','anything2')
    end
  end
  
  private
  
  def is_hamming_distance_1?(path)
    end_word = path.build_path!.last.word
    path.nodes.all? do |n|
      (n.neighbor.nil? && n.word == end_word ) || (!n.neighbor.nil? && n.word.hamming_distance(n,neighbor.word) == 1)
    end
  end
end