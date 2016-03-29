defmodule Mylist do

  # Exercise: ListsAndRecursion-5
  def all?([], _), do: true
  def all?([h|t], func) do
    if not func.(h), do: false, else: all?(t, func)
  end

  def each([], _), do: :ok
  def each([h|t], func) do
    func.(h)
    each(t, func)
  end

  def filter([], _), do: []
  def filter([h|t], func) do
    if func.(h), do: [h|filter(t, func)], else: filter(t, func)
  end

  def reverse(col), do: _reverse(col, [])

  def _reverse([], acc), do: acc
  def _reverse([h|t], acc), do: _reverse(t, [h|acc])

  def split(col, n), do: _split(col, n, [], [])

  def _split([], _, l, r), do: {reverse(l), r}
  def _split(col, 0, l, _), do: {reverse(l), col}
  def _split([h|t], n, l, r), do: _split(t, n - 1, [h|l], r)

  def take([], _), do: []
  def take(_, 0), do: []
  def take([h|t], n) when n > 0, do: [h|take(t, n - 1)]
  def take(col, n) when n < 0, do: reverse(take(reverse(col), n * - 1))

  # Exercise: ListsAndRecursion-6
  def flatten(l), do: reverse(_flatten(l, []))

  def _flatten([], acc), do: acc
  def _flatten([h|t], acc) when not is_list(h), do: _flatten(t, [h|acc])
  def _flatten([h|t], acc) do
    _flatten(t, _flatten(h, acc))
  end
end
