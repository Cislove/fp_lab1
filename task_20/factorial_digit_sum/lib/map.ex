defmodule FacDigitSum.Map do
  @moduledoc """
  Сумма цифр факториала через мапы
  """

  def exec(n) do
    Enum.map(1..(n - 1), &(&1 + 1))
    |> Enum.reduce(1, &(&1 * &2))
    |> Integer.to_string()
    |> String.to_charlist()
    |> Enum.map(fn x -> x - ?0 end)
    |> Enum.sum()
  end
end
