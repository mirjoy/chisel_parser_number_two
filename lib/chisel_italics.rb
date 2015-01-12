class Italicize

  def render(input)
    "<em>#{input.slice(1..(input.length - 2))}</em>"
  end

  def render_opening_tag(input)
    "<em>#{input.slice(1..(input.length))}"
  end

  def render_closing_tag(input)
    "#{input.slice(0..(input.length - 2))}</em>"
  end
end
