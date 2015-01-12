class Bold

  def render(input)
    "<strong>#{input.slice(2..(input.length - 3))}</strong>"
  end

  def render_opening_tag(input)
    "<strong>#{input.slice(2..(input.length))}"
  end

  def render_closing_tag(input)
    "#{input.slice(0..(input.length - 3))}</strong>"
  end
end
