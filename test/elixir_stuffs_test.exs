defmodule ElixirStuffsTest do
  use ExUnit.Case
  doctest ElixirStuffs

  test "greets the world" do
    assert ElixirStuffs.hello() == :world
  end
end
