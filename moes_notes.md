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
