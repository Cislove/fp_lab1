defmodule SumOfPrimes.Module do
  alias SumOfPrimes.Utils
  @moduledoc """
  Нахождение суммы простых через модульное решение
  """
  def sum_of_primes(n) do
    generate_sequence(n)
    |> remove_composites()
    |> sum_sequence()
  end

  defp generate_sequence(n) do
    2..n
  end

  defp remove_composites(sequence) do
    Enum.filter(sequence, fn x -> Utils.prime?(x) end)
  end

  defp sum_sequence(sequence) do
    Enum.reduce(sequence, 0, fn x, acc -> x + acc end)
  end
end
