require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel_italics.rb'

class ItalicizeTest < Minitest::Test
  attr_reader :italics

  def setup
    @italics = Italicize.new
  end

  def test_it_makes_a_paragraph
    input = "*This is a string*"
    assert_equal "<em>This is a string</em>", italics.render(input)
  end

  def test_it_makes_an_opening_tag
    input = "*This"
    assert_equal "<em>This", italics.render_opening_tag(input)
  end

  def test_it_makes_a_closing_tag
    input = "string.*"
    assert_equal "string.</em>", italics.render_closing_tag(input)
  end
end
