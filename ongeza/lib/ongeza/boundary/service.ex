defmodule Ongeza.Boundary.Service do
  alias Ongeza.Core.Counter

  def listen(count) do
    receive do
      :inc -> Counter.add(count) #handle_cast
      {:state, from} -> #handle_call
        send(from, count)
        count
    end
  end

  def run(count) do
    count
    |> listen()
    |> run()
  end

  def start(count) do
    #callback into init
    spawn( fn ->
      run(count)
    end)
  end
end
