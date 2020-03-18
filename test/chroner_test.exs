defmodule ChronerTest do
  use ExUnit.Case
  doctest Chroner

  test "greets the world" do
    assert Chroner.hello() == :world
  end
end
