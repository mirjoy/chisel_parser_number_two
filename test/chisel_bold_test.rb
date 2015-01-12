require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel_bold.rb'

class BoldTest < Minitest::Test
  attr_reader :bold

  def setup
    @bold = Bold.new
  end

  def test_it_makes_a_paragraph
    input = "**This is a string**"
    assert_equal "<strong>This is a string</strong>", bold.render(input)
  end

  def test_it_makes_an_opening_tag
    input = "**This"
    assert_equal "<strong>This", bold.render_opening_tag(input)
  end

  def test_it_makes_a_closing_tag
    input = "string.**"
    assert_equal "string.</strong>", bold.render_closing_tag(input)
  end
end
