defmodule Ongeza.Core.Server do
  use GenServer
  alias Ongeza.Core.Counter

  def init(count) do
    {:ok, Counter.new(count)}
  end

  def handle_cast(:inc, count) do
    {:noreply, Counter.add(count)}
  end

  def handle_call(:state, _from, count) do
    {:reply, Counter.convert(count), count}
  end

  # Client
  def inc(counter \\ :counter) do
    GenServer.cast(counter, :inc)
  end

  def state(counter \\ :counter) do
    GenServer.call(counter, :state)
  end

  def start_link(state) do
    GenServer.start(__MODULE__, state, name: :counter)
  end

end
