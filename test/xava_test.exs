defmodule XavaTest do
  use ExUnit.Case
  doctest Xava

  test "greets the world" do
    assert Xava.hello() == :world
  end
end
