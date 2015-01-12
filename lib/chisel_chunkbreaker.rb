require 'pry'

class ChunkBreaker

  def break_into_headers_and_paragraphs(input)
    lines = input.split(/\n/).delete_if do |line|
      line == ""
    end
  end

  def strip_extra_space(input_array)
    input_array.map do |ele|
      ele.strip
    end
  end

  def break_and_clean_up_lines(input)
    strip_extra_space(break_into_headers_and_paragraphs(input))
  end

  def make_words_an_array(input)
    input.split(' ')
  end

  def find_style(input, search_term)
    arr_of_words = make_words_an_array(input)
    new_arr = []

    arr_of_words.each do |word|
      if word.include?(search_term)
        new_arr << [word, arr_of_words.index(word)]
      end
    end
    return new_arr
  end

end


# document = '
# # My Life in Desserts
#
# ## Chapter 1: The Beginning
#
# "You just *have* to try the cheesecake," he said. "Ever since it appeared in
# **Food & Wine** this place has been packed every night."'

# breaker = ChunkBreaker.new("input")
# puts breaker.find_bold("You just **have** to ")
