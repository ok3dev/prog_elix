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

  # Exercise: ListsAndRecursion-4
  def span(from, to) when from === to, do: [from]

  def span(from, to) when from < to do
    [from | span(from + 1, to)]
  end

  def span(from, to) when from > to do
    [from | span(from - 1, to)]
  end

  def dave_span(from, to) when from > to, do: []

  def dave_span(from, to) do
    [from | span(from + 1, to)]
  end

  # Exercise: ListsAndRecursion-5
  def all?([], _func), do: true

  def all?([head | tail] = _list, func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  def each([], _func), do: []

  def each([head | tail] = _list, func) do
    [func.(head) | each(tail, func)]
  end

  def filter([], _func), do: []

  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  # Exercise ListsAndRecursion-7
  def primes(n) do
    for x <- span(2, n), y <- span(2, n), x > y, rem(x, y) !== 0, into: [2], do: x
  end

  # Exercise ListsAndRecursion-8

  orders = [
    [id: 123, ship_to: :NC, net_amount: 100.00],
    [id: 124, ship_to: :OK, net_amount: 35.50],
    [id: 125, ship_to: :TX, net_amount: 24.00],
    [id: 126, ship_to: :TX, net_amount: 44.80],
    [id: 127, ship_to: :NC, net_amount: 25.00],
    [id: 128, ship_to: :MA, net_amount: 10.00],
    [id: 129, ship_to: :CA, net_amount: 102.00],
    [id: 120, ship_to: :NC, net_amount: 50.00]
  ]

  def order_with_tax(orders) do
    for [id: id, ship_to: state, net_amount: amount] = order <- orders do
      add_tax(order)
    end
  end

  # ***** TODO ******
  # Refactor so that there isn't so much duplication
  # Try using `Keyword.get` for the tax_rates instead
  defp add_tax([_, ship_to: :NC, net_amount: net] = order) do
    order ++ [total_amount: net + net * 0.075]
  end

  defp add_tax([_, ship_to: :TX, net_amount: net] = order) do
    order ++ [total_amount: net + net * 0.08]
  end

  defp add_tax([_, _, net_amount: net] = order) do
    order ++ [total_amount: net]
  end
end
