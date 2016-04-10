defmodule MyStrings do

  # Exercise: StringsAndBinaries-1
  def is_printable?([]), do: true
  def is_printable?([h|_]) when h < ?\s, do: false
  def is_printable?([h|_]) when h > ?~, do: false
  def is_printable?([_|t]), do: is_printable?(t)

  # Exercise: StringsAndBinaries-2
  def anagram?(word1, word2) do
    word1 -- word2 == [] and word2 -- word1 == []
  end

  # Exercise: StringsAndBinaries-3
  # The result is a list that contains another list and three character codes, therefore not all elements are ASCII characters.
  # The sublist at the head of the list contains the character codes of the word 'cat' and since all elements of that list are ASCII characters codes the iex prints them.

  # Exercise: StringsAndBinaries-4
  def compute(l) do
    {int1, t} = parse_int(l, 0)
    {op, t} = parse_op(skip_space(t))
    {int2, _} = parse_int(skip_space(t), 0)
    exec(op, int1, int2)
  end

  defp exec(?+, int1, int2), do: int1 + int2
  defp exec(?-, int1, int2), do: int1 - int2
  defp exec(?*, int1, int2), do: int1 * int2
  defp exec(?/, int1, int2), do: int1 / int2

  defp parse_int([], acc), do: {acc, []}
  defp parse_int([h|_]=l, acc) when not h in ?0..?9, do: {acc, l}
  defp parse_int([h|t], acc), do: parse_int(t, acc * 10 + (h-?0))

  defp parse_op([h|t]) when h in '+-*/', do: {h, t}

  defp skip_space([?\s|t]), do: skip_space(t)
  defp skip_space(l), do: l

  # Exercise: StringsAndBinaries-5
  def center(text) do
    line_size = Enum.reduce(text, 0, &(max(String.length(&1), &2)))
    Enum.each(text, &(IO.puts(center_line(&1, line_size))))
  end

  def center_line(line, line_size) do
    String.rjust(line, div(line_size + String.length(line), 2))
  end

end
