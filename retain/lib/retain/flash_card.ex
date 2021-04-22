defmodule Retain.FlashCard do
  defstruct [:plan, :text]

  def new(text \\ "hello", steps \\ 2) do
    %__MODULE__{
      plan: plan(text, steps),
      text: text
    }
  end

  defp plan(text, steps) do
    length = String.length(text)

    chunk_size =
      length
      |> Kernel./(steps)
      |> ceil

    1..length
    |> Enum.shuffle()
    |> Enum.chunk_every(chunk_size)
  end
end
