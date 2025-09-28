defmodule SumOfPrimes.Utils do
  @moduledoc """
  Вспомогательные функции
  """
  def prime?(n) when n < 2, do: false
  def prime?(2), do: true
  def prime?(n), do: check_divisor(n, 2)

  defp check_divisor(n, d) when d * d > n, do: true

  defp check_divisor(n, d) do
    if rem(n, d) == 0, do: false, else: check_divisor(n, d + 1)
  end
end
