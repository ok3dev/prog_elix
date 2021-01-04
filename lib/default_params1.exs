defmodule DefaultParams1 do
  def func(p1, p2 \\ 123) do
    IO.inspect([p1, p2])
  end

  def func(p1, p2 \\ 99) do
    IO.inspect([p1, p2])
  end
end
