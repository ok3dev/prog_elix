defmodule StringsAndBinaries do
  # Exercise: StringsAndBinaries-1
  # ASCII printable characters are integer code points 32 through 126
  def only_ascii(chars) do
    Enum.all?(chars, fn char -> char >= 32 and char <= 126 end)
  end

  def anagram?(word1, word2), do: word1 -- word2 === []

  # Exercise: StringsAndBinaries-5
  def center(words) do
    width = Enum.max_by(words, &String.length(&1)) |> String.length()

    Enum.each(words, fn word ->
      String.pad_leading(word, div(width - String.length(word), 2)) |> IO.puts()
    end)
  end
end
