require './lib/chisel_chunkbreaker'
require './lib/chisel_header'
require './lib/chisel_bold'
require './lib/chisel_italics'
require './lib/chisel_paragraph'
require './lib/chisel_ordered_list'
require './lib/chisel_unordered_list'
require 'pry'


class Chisel
  attr_reader :bold,
              :header,
              :paragraph,
              :italics,
              :ordered_list,
              :unordered_list,
              :breaker

  def initialize
    @bold = Bold.new
    @header = Header.new
    @paragraph = Paragraph.new
    @italics = Italicize.new
    @ordered_list = OrderedList.new
    @unordered_list = UnorderedList.new
    @breaker = ChunkBreaker.new
  end

  def parse_header_and_paragraph(text)
    rendered_arr = (breaker.break_and_clean_up_lines(text)).map do |line|
      if line[0] == "#"
        header.render(line)
      else
        paragraph.render(line)
      end
    end
    return rendered_arr.join
  end


  def find_and_change_bold(text)
    is_opening_tag = true

    (breaker.find_style(text, "**")).map do |arr|
      case
      when arr[0].count("*") == 4
        [bold.render(arr[0]), arr[1]]
      when arr[0].count("*") == 2 && is_opening_tag == true
        is_opening_tag = false
        [bold.render_opening_tag(arr[0]), arr[1]]
      when arr[0].count("*") == 2 && is_opening_tag == false
        is_opening_tag = true
        [bold.render_closing_tag(arr[0]), arr[1]]
      end
    end
  end

  def parse_bold(text)
    final_string = breaker.make_words_an_array(text)
    arr_of_bolded_words = find_and_change_bold(text)

    arr_of_bolded_words.each do |word|
      final_string[word[1]] = word[0]
    end
    return final_string.join(" ")
  end

  def find_and_change_italics(text)
    is_opening_tag = true

    (breaker.find_style(text, "*")).map do |arr|
      case
      when arr[0].count("*") == 2
        [italics.render(arr[0]), arr[1]]
      when arr[0].count("*") == 1 && is_opening_tag == true
        is_opening_tag = false
        [italics.render_opening_tag(arr[0]), arr[1]]
      when arr[0].count("*") == 1 && is_opening_tag == false
        is_opening_tag = true
        [italics.render_closing_tag(arr[0]), arr[1]]
      end
    end
  end

  def parse_italics(text)
    final_string = breaker.make_words_an_array(text)
    arr_of_styled_words = find_and_change_italics(text)

    arr_of_styled_words.each do |word|
      final_string[word[1]] = word[0]
    end
    return final_string.join(" ")
  end

  def parse(text)
    headed_text = parse_header_and_paragraph(text)
    bolded = parse_bold(headed_text)
    parse_italics(bolded)
  end

end
