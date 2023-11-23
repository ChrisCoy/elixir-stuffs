defmodule Stuffs.Recursion do
  def sum([]), do: 0

  def sum([head | tail]) do
    head + sum(tail)
  end

  def count([]), do: 0

  def count([_h | t]) do
    1 + count(t)
  end

  def format_list_of_strings([]), do: []

  def format_list_of_strings([head | tail]) do
    [head |> String.replace(" ", "--") |> String.capitalize()] ++ format_list_of_strings(tail)
  end

  def occurrence_count([], _value), do: 0
  def occurrence_count([value | tail], value), do: 1 + occurrence_count(tail, value)
  def occurrence_count([_head | tail], value), do: occurrence_count(tail, value)
end
