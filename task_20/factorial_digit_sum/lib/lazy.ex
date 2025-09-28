defmodule FacDigitSum.Lazy do
  @moduledoc """
  Сумма числе факториала через ленивые вычисления
  """

  def exec(n) do
    2..(n)
    |> Enum.reduce(1, &(&1 * &2))
    |> Stream.unfold(fn
      0 -> nil
      x -> {rem(x, 10), div(x, 10) |> floor}
      end)
    |> Enum.sum
  end
end
