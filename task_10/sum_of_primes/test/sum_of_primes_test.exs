defmodule SumOfPrimesTest do
  use ExUnit.Case, async: true
  alias SumOfPrimes.Monolith
  alias SumOfPrimes.Module
  alias SumOfPrimes.Map
  alias SumOfPrimes.Lazy

  @answer 142_913_828_922
  @value 2_000_000

  test "Monolith SumOfPrimes" do
    assert Monolith.Recursion.sum_of_primes(@value) == @answer
    assert Monolith.TailRecursion.sum_of_primes(@value) == @answer
  end

  test "Module SumOfPrimes" do
    assert Module.sum_of_primes(@value) == @answer
  end

  test "map SumOfPrimes" do
    assert Map.sum_of_primes(@value) == @answer
  end

  test "lazy SumOfPrimes" do
    assert Lazy.sum_of_primes(@value) == @answer
  end
end
