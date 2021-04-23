defmodule Retain.Library do
  ~w[bruce tracey mo zaki christine]

  def card(item) when is_atom(item), do: item |> to_string |> card

  def card("bruce") do
    %{
      text: """
      Tomorrow, and tomorrow, and tomorrow,
      Creeps in this petty pace from day to day,
      To the last syllable of recorded time
      """,
      steps: 6
    }
  end

  def card("zaki") do
    %{
      text: """
      software is eating the world but AI will eat software
      """,
      steps: 3
    }
  end

  def card("moe") do
    %{
      text: """
      What runs but never walks, what has a mouth but never talks
      """,
      steps: 4
    }
  end

  def card("cristine") do
    %{
      text: "Faça coisas divertidas com abelhas operárias barulhentas!",
      steps: 3
    }
  end

  def card("tracey") do
    %{
      text: """
      fanya vitu vya kufurahisha na nyuki wakubwa wenye kazi kubwa
      """,
      steps: 4
    }
  end
end
