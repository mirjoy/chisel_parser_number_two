require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/chisel_ordered_list.rb'

class OrderedListTest < Minitest::Test
  attr_reader :list

  def setup
    @list = OrderedList.new
  end

  def test_it_makes_a_one_line_list
    input = "1. This is a string"
    assert_equal "<ol>\n<li>This is a string</li>\n</ol>\n", list.render(input)
  end

  def test_it_makes_a_two_line_list
    input = "1. This is a string.\n2. This is a second string."
    assert_equal "<ol>\n<li>This is a string.</li>\n<li>This is a second string.</li>\n</ol>\n", list.render(input)
  end

end
