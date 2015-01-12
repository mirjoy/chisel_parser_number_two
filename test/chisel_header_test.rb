require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel_header.rb'

class HeaderTest < Minitest::Test
  attr_reader :header

  def setup
    @header = Header.new
  end

  def test_it_makes_header_one
    input = "# This is a string"
    assert_equal "<h1>This is a string</h1>\n", header.render(input)
  end

  def test_it_makes_header_four
    input = "#### This is a string"
    assert_equal "<h4>This is a string</h4>\n", header.render(input)
  end
end
