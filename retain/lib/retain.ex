defmodule Retain do
  use GenServer
  alias Retain.FlashCard
  alias Retain.Library

  def init(name) do
    IO.puts("Starting #{name}")
    card = Library.card(name)
    {:ok, FlashCard.new(card.text, card.steps)}
  end

  def handle_call(:erase, _from, flashcard) do
    new_flashcard = FlashCard.erase(flashcard)
    {:reply, FlashCard.text(new_flashcard), new_flashcard}
  end

  def handle_cast(:kill, _flashcard) do
    raise "boom"
  end

  #API
  def erase(eraser) do
    1..50
    |> Enum.each(fn _ -> IO.puts("") end)
    GenServer.call(eraser, :erase)
  end

  def kill(eraser) do
    GenServer.cast(eraser, :kill)
  end

  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: name)
  end

  def child_spec(name) do
    %{
      id: name,
      start: {Retain, :start_link, [name]}
    }
  end

end
