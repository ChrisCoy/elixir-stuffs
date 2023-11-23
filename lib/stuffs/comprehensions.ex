defmodule ElixirStuffs.Comprehensions do
  def square(list) do
    for x <- list, do: x * x
  end

  def nested(list) do
    for x <- list, y <- list, do: {x, y, x * y}
  end

  # iex(16)> ElixirStuffs.Comprehensions.range(1, 10)
  # [{1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9}, {10}]
  #
  # iex(17)> ElixirStuffs.Comprehensions.range(10, 1)
  # [{10}, {9}, {8}, {7}, {6}, {5}, {4}, {3}, {2}, {1}]
  #
  # iex(18)> ElixirStuffs.Comprehensions.range("algo", "para")
  # (ArgumentError) ranges (first..last) expect both sides to be integers, got: "text".."text"
  def range(from, to) do
    for x <- from..to, do: {x}
  end

  def range(), do: for(x <- 1..5, do: {x})

  # iex(23)> ElixirStuffs.Comprehensions.into()
  # %{1 => 1, 2 => 4, 3 => 9, 4 => 16, 5 => 25}
  def into(), do: for(x <- 1..5, into: %{}, do: {x, x * x})

  def with_filters() do
    for x <- 1..5, y <- 1..5, x < y, into: %{}, do: {{x, y}, x * y}
  end
end
