class Italicize

  def render(input)
    if input[0..2] == "<p>"
      "<p><em>#{input.slice(4..(input.length - 2))}</em>"
    else
      "<em>#{input.slice(1..(input.length - 2))}</em>"
    end
  end

  def render_opening_tag(input)
    if input[0..2] == "<p>"
      "<p><em>#{input.slice(4..(input.length))}"
    else
      "<em>#{input.slice(1..(input.length))}"
    end
  end

  def render_closing_tag(input)
    if input[-4..-1] == "</p>"
      "#{input.slice(0..(input.length - 7))}</em></p>"
    else
      "#{input.slice(0..(input.length - 2))}</em>"
    end
  end
end
