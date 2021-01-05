defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head | tail]), do: [head * head] ++ square(tail)

  def add_1([]), do: []
  def add_1([h | t]), do: [h + 1 | add_1(t)]

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def reduce([], value, _func), do: value

  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  # Exercise: ListsAndRecursion-1
  def mapsum([], _func), do: 0

  def mapsum(coll, func) do
    coll
    |> map(func)
    |> reduce(0, &(&1 + &2))
  end

  # Exercise: ListsAndRecursion-2
  def max([]), do: []
  def max([a]), do: a

  def max([head | tail])
      when head > hd(tail) do
    max([head | tl(tail)])
  end

  def max([head | tail])
      when head < hd(tail) do
    max([hd(tail) | tl(tail)])
  end

  # Exercise: ListsAndRecursion-3
  def caesar([], _n), do: []

  def caesar([head | tail], n)
      when head + n <= ?z do
    [head + n | caesar(tail, n)]
  end

  def caesar([head | tail], n) do
    [head + n - 26 | caesar(tail, n)]
  end
end
