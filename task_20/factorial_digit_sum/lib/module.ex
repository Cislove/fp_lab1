defmodule FacDigitSum.Module do
  @moduledoc """
  Сумма цифр факторила модульная
  """
  def exec(n) do
    generate_sequence(n)
    |> multiply_sequence()
    |> get_digits()
    |> sum_sequence()
  end

  defp generate_sequence(n), do: 1..n

  defp multiply_sequence(sequence), do: Enum.reduce(sequence, 1, &(&1 * &2))

  defp get_digits(n), do: Integer.digits(n)

  defp sum_sequence(sequence), do: Enum.reduce(sequence, &(&1 + &2))
end
