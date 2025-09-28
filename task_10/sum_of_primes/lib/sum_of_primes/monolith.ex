defmodule SumOfPrimes.Monolith.Recursion do
  @moduledoc """
  Нахождение суммы простых через рекурсию
  """
  def sum_of_primes(1), do: 0

  def sum_of_primes(n) do
    temp = sum_of_primes(n - 1)
    if prime?(n), do: n + temp, else: temp
  end

  defp prime?(n) when n < 2, do: false
  defp prime?(2), do: true
  defp prime?(n), do: check_divisor(n, 2)

  defp check_divisor(n, d) when d * d > n, do: true
  defp check_divisor(n, d), do: rem(n, d) != 0 and check_divisor(n, d + 1)
end

defmodule SumOfPrimes.Monolith.TailRecursion do
  alias SumOfPrimes.Utils

  @moduledoc """
  Нахождение суммы простых через хвостовую рекурсию
  функция prime?, реализованная через хвостовую рекурсию, взята из модуля Utils для избежания дублирования кода
  """
  def sum_of_primes(n), do: sum_of_primes(n, 0)
  defp sum_of_primes(1, acc), do: acc

  defp sum_of_primes(n, acc) do
    if Utils.prime?(n), do: sum_of_primes(n - 1, acc + n), else: sum_of_primes(n - 1, acc)
  end
end
