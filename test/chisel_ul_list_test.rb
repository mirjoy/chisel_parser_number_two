require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/chisel_unordered_list.rb'

class UnorderedListTest < Minitest::Test
  attr_reader :list

  def setup
    @list = UnorderedList.new
  end

  def test_it_makes_a_one_line_list
    input = "* This is a string"
    assert_equal "<ul>\n<li>This is a string</li>\n</ul>\n", list.render(input)
  end

  def test_it_makes_a_two_line_list
    input = "* This is a string.\n* This is a second string."
    assert_equal "<ul>\n<li>This is a string.</li>\n<li>This is a second string.</li>\n</ul>\n", list.render(input)
  end

end
