defmodule Enigma.Game do
  defstruct [answer: [1, 2, 3, 4], attempts: []]

  def generate_answer() do
    1..8 |> Enum.shuffle() |> Enum.take(4)
  end

  def new(answer) do
    %__MODULE__{answer: answer}
  end

  def guess(%__MODULE__{} = game, attempt) do
    %{game | attempts: [attempt | game.attempts]}
  end

  def render(game) do
    """
    1 2 3 4 | RW
    4 1 5 3 | RRWW
    Playing
    """
  end

  defp won?(%__MODULE__{answer: answer, attempts: [answer | _rest]}), do: true
  defp won?(_game), do: false
end
