defmodule Monolith.TailRecursion do
  @moduledoc """
  Вычисление суммы цифр факториала через хвостовую рекурсию
  """
  def exec(n), do: sum_of_digit(0, factorial(n))

  defp sum_of_digit(acc, 0), do: acc
  defp sum_of_digit(acc, n), do: sum_of_digit(acc + rem(n, 10), div(n, 10) |> floor)

  defp factorial(n), do: factorial(1, n)
  defp factorial(acc, 0), do: acc
  defp factorial(acc, n) when n > 0, do: factorial(acc * n, n - 1)

end

defmodule Monolith.Recursion do
  @moduledoc """
  Вычисление суммы цифр факториала через рекурсию
  """

  def exec(n), do: sum_of_digit(factorial(n))

  defp sum_of_digit(n) when (n / 10 |> floor) == 0, do: rem(n, 10)
  defp sum_of_digit(n) do
    temp = sum_of_digit(div(n, 10) |> floor)
    temp + rem(n, 10)
  end

  defp factorial(1), do: 1
  defp factorial(n) do
    temp = factorial(n - 1)
    temp * n
  end
end
