defmodule Ongeza.Core.Counter do
  # It's a constructor Moh!
  def new(n) do
    String.to_integer(n)
  end

  def add(acc \\ 1, n) do
    acc + n
  end

  def convert(n) do
    to_string(n)
  end

  # def flow(n) do
  #   n
  #   |> new()
  #   |> add()
  #   |> convert()
  # end
end
