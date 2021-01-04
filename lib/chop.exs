defmodule Chop do
  def guess(actual, a..b) do
    guess = div(b + a, 2)
    IO.puts("Is it #{guess}")
    adjust_guess(actual, guess, a, b)
  end

  def adjust_guess(actual, guess, _a, _b) when actual === guess do
    "#{actual} is the correct guess!"
  end

  def adjust_guess(actual, guess, a, _b) when actual < guess do
    guess(actual, a..(guess - 1))
  end

  def adjust_guess(actual, guess, _a, b) when actual > guess do
    guess(actual, (guess + 1)..b)
  end
end
