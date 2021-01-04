defmodule Chop do
  def guess(actual, a..b = range) do
    # In Dave Thomas's code, he used def guess(actual, range = low..high)
    # Putting `range` on either side will still bind whatever argument is
    # passed second to `range`
    guess = div(a + b, 2)
    IO.puts("Is it #{guess}")
    adjust_guess(actual, guess, range)
  end

  defp adjust_guess(actual, guess, _a.._b = _range) when actual === guess do
    "#{actual} is the correct guess!"
  end

  defp adjust_guess(actual, guess, a.._b = _range) when actual < guess do
    guess(actual, a..(guess - 1))
  end

  defp adjust_guess(actual, guess, _a..b = _range) when actual > guess do
    guess(actual, (guess + 1)..b)
  end

end
