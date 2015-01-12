require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel_paragraph.rb'

class ParagraphTest < Minitest::Test
  attr_reader :paragraph

  def setup
    @paragraph = Paragraph.new
  end

  def test_it_makes_a_paragraph
    input = "This is a string"
    assert_equal "<p>This is a string</p>\n", paragraph.render(input)
  end

end
