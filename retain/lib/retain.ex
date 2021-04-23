defmodule Retain do
  use GenServer
  alias Retain.FlashCard

  def init({text, steps}) do
    {:ok, FlashCard.new(text, steps)}
  end

  def handle_call(:erase, _from, flashcard) do
    new_flashcard = FlashCard.erase(flashcard)
    {:reply, FlashCard.text(new_flashcard), new_flashcard}
  end

  #API
  def erase(eraser \\ __MODULE__) do
    1..50
    |> Enum.each(fn _ -> IO.puts("") end)
    GenServer.call(eraser, :erase)
  end

  def start_link(state, opts \\ [name: __MODULE__]) do
    GenServer.start_link(__MODULE__, state, opts)
  end

end
