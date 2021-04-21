defmodule Ongeza.Boundary.Server do
  use GenServer
  alias Ongeza.Core.Counter

  def init(count) do
    {:ok, Counter.new(count)}
  end

  def handle_cast(:inc, count) do
    {:noreply, Counter.add(count)}
  end

  def handle_cast(:kill, _state) do
    raise "boom"
  end

  def handle_call(:state, _from, count) do
    {:reply, Counter.convert(count), count}
  end

  # Client
  def inc(counter \\ __MODULE__) do
    GenServer.cast(counter, :inc)
  end

  def kill(counter \\ __MODULE__) do
    GenServer.cast(counter, :kill)
  end

  def state(counter \\ __MODULE__) do
    GenServer.call(counter, :state)
  end

  def start_link(state, opts \\ [name: __MODULE__]) do
    GenServer.start(__MODULE__, state, opts)
  end

  def child_spec(state) do
    %{
      id: Ongeza,
      start: {__MODULE__, :start_link, [state]}}
  end


end
