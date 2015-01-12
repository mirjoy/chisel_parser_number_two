class Header

  def render(input)
    header_num = input.count("#")
    "<h#{header_num}>#{input.slice((1 + header_num)..input.length)}</h#{header_num}>\n"
  end

end
