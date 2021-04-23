defmodule Retain.Library do
  ~w[bruce tracey mo zaki christine]

  def card(item) when is_atom(item), do: item |> to_string |> card

  def card("bruce") do
    %{
      text: """
            We the People of the United States,
            in Order to form a more perfect Union,
            establish Justice, insure domestic Tranquility,
            provide for the common defence,
            promote the general Welfare,
            and secure the Blessings of Liberty
            to ourselves and our Posterity,
            do ordain and establish this Constitution
            for the United States of America.
            """,
      steps: 8
    }
  end

  def card("cristine") do
    %{
      text: "Faça coisas divertidas com abelhas operárias barulhentas!",
      steps: 3
    }
  end

end
