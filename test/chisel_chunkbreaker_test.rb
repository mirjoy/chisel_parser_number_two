require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/chisel_chunkbreaker.rb'

class ChunkBreakerTest < Minitest::Test
  attr_accessor :chunk

  def setup
    @chunk = ChunkBreaker.new
  end

  def test_it_exists
    assert ChunkBreaker
  end

  def test_it_splits_a_line
    input = '# My Life in Desserts
    ## Chapter 1: The Beginning'
    new_arr = chunk.break_into_headers_and_paragraphs(input)
    assert_equal ['# My Life in Desserts', '    ## Chapter 1: The Beginning'], new_arr
  end

  def test_it_strips_extra_space
    input = '# My Life in Desserts
    ## Chapter 1: The Beginning'
    new_arr = chunk.break_into_headers_and_paragraphs(input)
    assert_equal ['# My Life in Desserts', '## Chapter 1: The Beginning'], chunk.strip_extra_space(new_arr)
  end

  def test_break_and_clean_up_lines
    input = "  # My Life in Desserts

     ## Chapter 1: The Beginning  "
    assert_equal ['# My Life in Desserts', '## Chapter 1: The Beginning'], chunk.break_and_clean_up_lines(input)
  end

  def test_it_makes_an_array_of_words
    input = "You just **have**"
    assert_equal ["You", "just", "**have**"], chunk.make_words_an_array(input)
  end

  def test_it_finds_bold
    input = "You just **have** to try the cheesecake"
    assert_equal [['**have**', 2]], chunk.find_style(input, "**")
  end

end
