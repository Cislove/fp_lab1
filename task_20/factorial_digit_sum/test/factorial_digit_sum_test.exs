defmodule FactorialDigitSumTest do
  use ExUnit.Case, async: true
  alias FacDigitSum.Lazy
  alias FacDigitSum.Map
  alias FacDigitSum.Monolith
  alias FacDigitSum.Module

  @value 100
  @answer 648

  test "monolith factorial digit sum" do
    assert Monolith.Recursion.exec(@value) == @answer
    assert Monolith.TailRecursion.exec(@value) == @answer
  end

  test "module factorial digit sum" do
    assert Module.exec(@value) == @answer
  end

  test "map factorial digit sum" do
    assert Map.exec(@value) == @answer
  end

  test "lazy factorial digit sum" do
    assert Lazy.exec(@value) == @answer
  end
end
