# Лабораторная работа №1
**Выполнил**: Рахимов Ильнар (409442)
***
## Вариант 10
![alt text](image.png)
### Монолитная реализация
#### Рекурсия
```elixir
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
```
#### Хвостовая рекурсия
```elixir
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
```
### Модульная реализация
```elixir
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
```
### Генерация последовательности при помощи map
```elixir
defmodule SumOfPrimes.Map do
  @moduledoc """
  Cумма простых чисел через map
  """
  def sum_of_primes(n) do
    Enum.map(1..max(n - 1, 1), &(&1 + 1))
    |> Enum.map(fn x ->
      {
        x,
        2..((:math.sqrt(x) |> floor) + 1)
        |> Enum.filter(&(rem(x, &1) == 0))
      }
    end)
    |> Enum.filter(fn {x, divs} -> divs == [] or divs == [x] end)
    |> Enum.map(fn {x, _} -> x end)
    |> Enum.reduce(0, &(&1 + &2))
  end
end
```
### Ленивые коллекции
```elixir
defmodule SumOfPrimes.Lazy do
  @moduledoc """
  Вычисление суммы простых через ленивые потоки
  """

  def sum_of_primes(n) do
    2..n
    |> Stream.filter(fn x ->
      2..((:math.sqrt(x) |> floor) + 1)
      |> Enum.all?(fn d -> rem(x, d) != 0 or x == d end)
    end)
    |> Enum.sum()
  end
end
```
### Реализация на Java
```java
public class SumOfPrimes{
    public long sumOfPrimes(int n){
        long result = 0;
        for(int i = 2; i <= n; i++){
            result += isPrime(i) ? i : 0;
        }
        return result;
    }

    private boolean isPrime(int n){
        if (n < 2) return false;

        for(int i = 2; i <= (int) Math.sqrt(n); i++){
            if (n % i == 0){
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args){
        SumOfPrimes sp = new SumOfPrimes();
        System.out.println(sp.sumOfPrimes(Integer.parseInt(args[0])));
    }
}
```
## Вариант 20
![alt text](image.png)
### Монолитная реализация
#### Рекурсия
```elixir
defmodule FacDigitSum.Monolith.Recursion do
  @moduledoc """
  Вычисление суммы цифр факториала через рекурсию
  """

  def exec(n), do: sum_of_digit(factorial(n))

  defp sum_of_digit(n) when (n / 10) |> floor == 0, do: rem(n, 10)

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
```
#### Хвостовая рекурсия
```elixir
defmodule FacDigitSum.Monolith.TailRecursion do
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
```
### Модульная реализация
```elixir
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
```
### Генерация последовательности при помощи map
```elixir
defmodule FacDigitSum.Map do
  @moduledoc """
  Сумма цифр факториала через мапы
  """

  def exec(n) do
    Enum.map(1..(n - 1), &(&1 + 1))
    |> Enum.reduce(1, &(&1 * &2))
    |> Integer.to_string()
    |> String.to_charlist()
    |> Enum.map(fn x -> x - ?0 end)
    |> Enum.sum()
  end
end
```
### Ленивые коллекции
```elixir
defmodule FacDigitSum.Lazy do
  @moduledoc """
  Сумма числе факториала через ленивые вычисления
  """

  def exec(n) do
    2..n
    |> Enum.reduce(1, &(&1 * &2))
    |> Stream.unfold(fn
      0 -> nil
      x -> {rem(x, 10), div(x, 10) |> floor}
    end)
    |> Enum.sum()
  end
end
```
### Реализация на Java
```java
import java.math.BigInteger;

public class FactorialDigitSum{
    private static BigInteger factorial(int n){
        BigInteger result = BigInteger.ONE;

        for(int i = 2; i <= n; i++){
            result = result.multiply(BigInteger.valueOf(i));
        }
        return result;
    }

    private static int sumOfDigit(BigInteger factorial){
        String digits = factorial.toString();
        int result = 0;

        for(var c: digits.toCharArray()){
            result += c - '0';
        }
        return result;
    }

    public static void main(String[] args){
        System.out.println(sumOfDigit(factorial(Integer.parseInt(args[0]))));
    }
}
```
***
## Вывод
В ходе выполнения лабораторной работы мне удалось:
- **Ознакомиться с основами функционального программирования на языке Elixir**
- **Реализовать решения задач 10 и 20 проекта Эйлера**
- **Применить различные техники программирования:**
    - Рекурсия (обычная и хвостовая)
    - Модульный подход
    - Генерация последовательностей при помощи `map`
    - Ленивые вычисления с использованием `Stream`
- **Сравнить функциональный подход `Elixir` с императивным `Java`**
