defmodule StringsAndBinaries do
  # Exercise: StringsAndBinaries-1
  # ASCII printable characters are integer code points 32 through 126
  def only_ascii(chars) do
    Enum.all?(chars, fn char -> char >= 32 and char <= 126 end)
  end

  def anagram?(word1, word2) do
    if word1 -- word2 === [] do
      true
    else
      false
    end
  end
end
