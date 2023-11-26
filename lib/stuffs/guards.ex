defmodule Stuffs.Guards do
  def is_positive(x) when is_number(x) and x > 0, do: :positive
  def is_positive(x) when is_number(x) and x < 0, do: :negative
  def is_positive(0), do: :zero
  def is_positive(_), do: :nan

  def is_element_number(el) when is_number(el), do: true
  def is_element_number(el) when not is_number(el), do: false

  def is_element_list(el) when is_list(el), do: true
  def is_element_list(el) when not is_list(el), do: false

  lambda_guards = fn
    x when is_number(x) and x < 0 ->
      :negative

    0 ->
      :zero

    x when is_number(x) and x > 0 ->
      :positive
  end
end
