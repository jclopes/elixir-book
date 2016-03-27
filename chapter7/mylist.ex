defmodule MyList do

  # Exercise: ListsAndRecursion-0
  def sum([]), do: 0
  def sum([h|t]), do: h + sum(t)

  # Exercise: ListsAndRecursion-1
  def mapsum([], _), do: 0
  def mapsum([h|t], function), do: function.(h) + mapsum(t, function)

  # Exercise: ListsAndRecursion-2
  def max([h|t]), do: _max(t, h)

  def _max([], acc), do: acc
  def _max([h|t], acc) when h <= acc, do: _max(t, acc)
  def _max([h|t], acc) when h > acc, do: _max(t, h)

  # Exercise: ListsAndRecursion-3
  def caesar([], _), do: []
  def caesar([h|t], n) when (h + n) <= ?z, do: [h + n|caesar(t, n)]
  def caesar([h|t], n) when (h + n) > ?z, do: [h + n - 26|caesar(t, n)]

  # Exercise: ListsAndRecursion-4
  def span(from, from), do: [from]
  def span(from, to) when from < to, do: [from|span(from + 1, to)]

end
