defmodule SumOfPrimes.Map do
  @moduledoc """
  Cумма простых чисел через map
  """
  def sum_of_primes(n) do
    Enum.map(1..max(n - 1, 1), &(&1 + 1))
    |> Enum.map(fn x ->
      {
        x,
        2..((:math.sqrt(x) |> floor) + 1)
        |> Enum.filter(&(rem(x, &1) == 0))
      }
    end)
    |> Enum.filter(fn {x, divs} -> divs == [] or divs == [x] end)
    |> Enum.map(fn {x, _} -> x end)
    |> Enum.reduce(0, &(&1 + &2))
  end
end
