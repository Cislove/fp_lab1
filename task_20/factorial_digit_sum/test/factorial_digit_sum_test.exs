defmodule FactorialDigitSumTest do
  use ExUnit.Case, async: true

  @value 100
  @answer 648

  test "monolith factorial digit sum" do
    assert Monolith.TailRecursion.exec(@value) == @answer
    assert Monolith.Recursion.exec(@value) == @answer
  end

  test "module factorial digit sum" do
    assert(FacDigitSum.Module.exec(@value) == @answer)
  end

  test "map factorial digit sum" do
    assert(FacDigitSum.Map.exec(@value) == @answer)
  end

  test "lazy factorial digit sum" do
    assert(FacDigitSum.Lazy.exec(@value) == @answer)
  end
end
