defmodule RetainTest do
  use ExUnit.Case
  doctest Retain

  test "greets the world" do
    assert Retain.hello() == :world
  end
end
