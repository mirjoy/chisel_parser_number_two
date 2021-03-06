class UnorderedList
  attr_reader :final_lines

  def initialize
    @final_lines = ''
  end

  def split_lines(string)
    string.split(/\n/)
  end

  def add_individual_lis(input_split_in_lines)
    input_split_in_lines.each do |line|
      @final_lines << ("<li>" + line.slice(2..line.length) + "</li>\n")
    end
  end

  def render(string)
    add_individual_lis(split_lines(string))
    "<ul>\n" + @final_lines + "</ul>\n"
  end
end
