defmodule Ongeza.Boundary.Service do
  alias Ongeza.Core.Counter

  def start(count) do
    #callback into init
    spawn( fn ->
      run(count)
    end)
  end

  def run(count) do
    count
    |> listen()
    |> run()
  end

  def listen(count) do
    receive do
      :inc -> Counter.add(count) #handle_cast

      {:state, from} -> #handle_call
        send(from, count)
        count #state
    end
  end

  # request increment (Process A)
  def inc(counter) do
    send(counter, :inc)
  end

  # ask for and receive state (Process B)
  def state(counter) do

    send(counter, {:state, self})

    receive do
      counter -> counter
    end

  end
end


# alias - just the trailing word e.g. Ongeza.Core.Counter -> Counter
# import -  making all the functions available as if they were declared publicly
# use -  call the __USING__ macro (code that writes code)

# SERVICE (counter) --> CLIENT (iex)
#      186                  183
