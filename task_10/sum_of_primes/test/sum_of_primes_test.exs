defmodule SumOfPrimesTest do
  use ExUnit.Case, async: true

  @answer 142_913_828_922
  @value 2_000_000

  test "Monolith SumOfPrimes" do
    assert SumOfPrimes.Monolith.Recursion.sum_of_primes(@value) == @answer
    assert SumOfPrimes.Monolith.TailRecursion.sum_of_primes(@value) == @answer
  end

  test "Module SumOfPrimes" do
    assert SumOfPrimes.Module.sum_of_primes(@value) == @answer
  end

  test "map SumOfPrimes" do
    assert SumOfPrimes.Map.sum_of_primes(@value) == @answer
  end

  test "lazy SumOfPrimes" do
    assert SumOfPrimes.Lazy.sum_of_primes(@value) == @answer
  end
end
