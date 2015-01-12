class OrderedList
  attr_reader :final_lines

  def initialize
    @final_lines = ''
  end

  def split_lines(string)
    string.split(/\n/)
  end

  def add_individual_lis(input_split_in_lines)
    input_split_in_lines.each do |line|
        @final_lines << ("<li>" + line.slice(3..line.length) + "</li>\n")
      end
  end

  def render(string)
    add_individual_lis(split_lines(string))
    "<ol>\n" + @final_lines + "</ol>\n"
  end
end
