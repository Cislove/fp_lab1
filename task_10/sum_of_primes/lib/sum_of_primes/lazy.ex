defmodule SumOfPrimes.Lazy do
  @moduledoc """
  Вычисление суммы простых через ленивые потоки
  """

  def sum_of_primes(n) do
    2..n
    |> Stream.filter(fn x ->
      2..((:math.sqrt(x) |> floor) + 1)
      |> Enum.all?(fn d -> rem(x, d) != 0 or x == d end)
    end)
    |> Enum.sum()
  end
end
