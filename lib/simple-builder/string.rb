class String

  def to_html
    Simple::Builder.string_to_html(self)
  end

end