04/21/2021 - Notes for OTP

-fn(acc + x) is the same as &(&2 + &1)

Do                 - Data
Fun               - Functions
Things          - Tests
With  
Big                - Boundaries
Loud             - Lifecycle
Worker         - Other External Dependencies
Bees              - Workers


- adding two backwards slashes to an argument is how you set a default to an argument -> Example: def add (acc \\ 1, n), do: <-- this sets the accumulator default set to 1 if there is no argument.
Another example: def state(counter \\ :counter) do <--- this just means if there is no argument when you call the state, it will default to :counter)

- def start in our service.ex is our lifecycle management function
- start > run > listen > run > listen > run > listen <--- this whole session is continuous due to the run function
- inside of IEX:
counter = start(42)
inc(counter) -> returns :inc
state(counter) -> return the number (42)



04/22/2021 - Notes for OTP

- GenServer.whereis Server
- GenServer.whereis "name inside of application.ex"

- Homework - find something to memorize:
"what runs but never walks, and has a mouth but never talks"

what does the flashcard look like
what is your strat for computing the CRC
-
prepare the work
do the work
present the work

#flash_card
-text

#number of steps
-5

#accumulator
- ""

#list of words
- ~w[
#reducer
- fn word, acc -> word <> " " <> acc


Enum.reduce(numbers, reduce)
0 |> reduce.(12) |> reduce.(13) |> reduce.(14)

both return 39

0 is the accumulator (the starting point)
accumulator is the starting point of whatever you're doing (a list of numbers or a string)

c - t's an intermediate value that keeps transformation
t - our current state is an accumulator
z - he starting state of your function
b - cratch pad of taking notes of intermediate values, one small step at a time, acc is the value so far, number would be total, string would be what it is so far

list = [12, 15, 40]
reducer = fn number, acc -> number + acc end
enum.reduce(reduce, list, reducer)

Elixir will always pick an accumulator from your list.


init = Retain.new
handle_cast = the reducer
handle_call = the txt
