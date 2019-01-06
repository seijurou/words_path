require 'minitest/autorun'
require_relative '../hamming'

class TestHamming < MiniTest::Unit::TestCase
  
  def test_distance_1
    assert_equal(1, 'rial'.hamming_distance('real'))
  end
  
  def test_distance_5
    assert_equal(8, 'aqswdefrgt'.hamming_distance('asdfgoiuyt'))
  end
  
  def test_triggers_exception
    assert_raises ArgumentError do
      'book'.hamming_distance('bokop')
    end
  end
end