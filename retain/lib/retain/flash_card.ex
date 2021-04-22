defmodule Retain.FlashCard do
  defstruct [:plan, :text]

  @reject [" ", "?", "!", ".", "-", ",", "\n"]

  def new(text \\ "hello", steps \\ 2) do
    %__MODULE__{
      plan: plan(text, steps),
      text: text
    }
  end

  def text(flashcard), do: flashcard.text

  def erase(%{plan: [], text: _text} = flashcard), do: flashcard

  def erase(%{plan: [step | plan], text: text} = flashcard) do
    %{flashcard | plan: plan, text: replace_text(text, step)}
  end

  defp replace_text(text, step) do
    text
    |> String.graphemes()
    |> Enum.with_index(1)
    |> Enum.map(fn {letter, index} -> maybe_replace(letter, index in step) end)
    |> Enum.join()
  end

  defp maybe_replace(letter, _index) when letter in @reject, do: letter
  defp maybe_replace(_letter, true = _replace), do: "_"
  defp maybe_replace(letter, false = _replace), do: letter

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
