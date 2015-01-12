require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel_redo.rb'

class ChiselTest < Minitest::Test
  attr_reader :chisel

  def setup
    @chisel = Chisel.new
  end

  def test_it_exists
    assert Chisel
  end

  def test_it_can_parse_a_header
    input = "# My Life in Desserts

    ## Chapter 1: The Beginning"
    assert_equal "<h1>My Life in Desserts</h1>\n<h2>Chapter 1: The Beginning</h2>\n", chisel.parse_header_and_paragraph(input)
  end

  def test_it_can_parse_a_header_and_paragraph
    input = "# My Life in Desserts

    You just *have* to try the cheesecake."
    assert_equal "<h1>My Life in Desserts</h1>\n<p>You just *have* to try the cheesecake.</p>\n", chisel.parse_header_and_paragraph(input)
  end

  def test_it_can_parse_an_unordered_list
    input = "* Sushi"
    assert_equal ["<ul>\n<li>Sushi</li>\n</ul>\n"], chisel.find_and_change_lists(input)
  end

  def test_it_can_parse_an_unordered_list_with_two_things
    skip
    input = "* Sushi
    * Chocolate"
    assert_equal ["<ul>\n<li>Sushi</li>\n<li>Chocolate</li>\n</ul>\n"], chisel.find_and_change_lists(input)
  end

  def test_it_can_parse_an_ordered_list
    input = "1. Sushi"
    assert_equal ["<ol>\n<li>Sushi</li>\n</ol>\n"], chisel.find_and_change_lists(input)
  end

  def test_it_can_parse_a_bold_word
    input = "You just **have** to try the cheesecake."
    assert_equal [["<strong>have</strong>", 2]], chisel.find_and_change_bold(input)
  end

  def test_it_can_parse_two_bold_words
    input = "You just **have** to **try** the cheesecake."
    assert_equal [["<strong>have</strong>", 2], ["<strong>try</strong>", 4]], chisel.find_and_change_bold(input)
  end

  def test_it_can_parse_two_bold_words
    input = "You just **have** to **try** the cheesecake."
    assert_equal [["<strong>have</strong>", 2], ["<strong>try</strong>", 4]], chisel.find_and_change_bold(input)
  end

  def test_it_can_parse_a_bold_phrase
    input = "You just **have to try** the cheesecake."
    assert_equal [["<strong>have", 2], ["try</strong>", 4]], chisel.find_and_change_bold(input)
  end

  def test_it_can_reinsert_bold_words
    input = "You just **have to try** the cheesecake."
    assert_equal "You just <strong>have to try</strong> the cheesecake.", chisel.parse_bold(input)
  end

  def test_it_can_reinsert_one_bold_word
    input = "You just **have** to try the cheesecake."
    assert_equal "You just <strong>have</strong> to try the cheesecake.", chisel.parse_bold(input)
  end

  def test_it_can_parse_an_italic_word
    input = "You just *have* to try the cheesecake."
    assert_equal [["<em>have</em>", 2]], chisel.find_and_change_italics(input)
  end

  def test_it_can_parse_an_italic_phrase
    input = "You just *have to try* the cheesecake."
    assert_equal [["<em>have", 2], ["try</em>", 4]], chisel.find_and_change_italics(input)
  end

  def test_it_can_parse_bolds_within_italics
    input = "You just *have **to** try* the cheesecake."
    assert_equal "<p>You just <em>have <strong>to</strong> try</em> the cheesecake.</p>", chisel.parse(input)
  end

  def test_it_can_parse_italics_within_bolds
    input = "You just **have *to* try** the cheesecake."
    assert_equal "<p>You just <strong>have <em>to</em> try</strong> the cheesecake.</p>", chisel.parse(input)
  end
end
