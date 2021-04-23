defmodule Retain.Application do

  use Application

  def start(_type, _args) do
    children = [
      {Retain, {"Hello", 5}}
    ]

    opts = [strategy: :one_for_one, name: Retain.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
