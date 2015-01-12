class Bold

  def render(input)
    if input[0..2] == "<p>"
      "<p><strong>#{input.slice(5..(input.length - 3))}</strong>"
    else
      "<strong>#{input.slice(2..(input.length - 3))}</strong>"
    end
  end

  def render_opening_tag(input)
    if input[0..2] == "<p>"
      "<p><strong>#{input.slice(5..(input.length))}"
    else
      "<strong>#{input.slice(2..(input.length))}"
    end
  end

  def render_closing_tag(input)
    if input[-4..-1] == "</p>"
      "#{input.slice(0..(input.length - 7))}</strong></p>"
    else
      "#{input.slice(0..(input.length - 3))}</strong>"
    end
  end
end
