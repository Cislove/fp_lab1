defmodule SumOfPrimesMonolith do
	def sum_of_primes(1), do: 0
	def sum_of_primes(n) do
		if prime?(n), do: n + sum_of_primes(n - 1), else: sum_of_primes(n - 1)
	end


	defp prime?(n) when n < 2, do: false
	defp prime?(2), do: true
	defp prime?(n), do: check_divisor(n, 2)

	defp check_divisor(n, d) when d * d > n do
		true
	end
	defp check_divisor(n, d) do
		if rem(n, d) == 0, do: false, else: check_divisor(n, d + 1)
	end

end
