defmodule Stuffs.Others do
  def in_operator(list, el), do: el in list

  def multiple_line_string() do
    """
    Here is some text
    Here is another text
    Here is yet more text
    """
  end
end
