defmodule Ongeza.Core.CounterTest do
  use ExUnit.Case
  import Ongeza.Core.Counter

  test "flow" do
    expected = "43"

    actual =
      "42"
      |> new()
      |> add()
      |> assert_value(43)
      |> add()
      |> assert_value(44)
      |> add(-1)
      |> assert_value(43)
      |> convert()

    assert actual == expected
  end

  defp assert_value(actual, expected) do
    assert actual == expected
    actual
  end
end
