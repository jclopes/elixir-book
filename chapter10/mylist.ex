defmodule MyList do

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

  def split(col, n) when n < 0 do
    {a, b} = _split(reverse(col), abs(n), [], [])
    {reverse(b), reverse(a)}
  end
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

  # Exercise: ListsAndRecursion-4 (from chapter7)
  def span(from, from), do: [from]
  def span(from, to) when from < to, do: [from|span(from + 1, to)]
  def span(from, to) when from > to, do: [from|span(from - 1, to)]

  # Exercise: ListsAndRecursion-7
  def primes(n), do: for p <- span(2, n), prime?(p), do: p

  def prime?(n) when n >= 0 and n < 2, do: false
  def prime?(2), do: true
  def prime?(n) when n > 2, do: _prime?(n, span(2, div(n, 2)))

  defp _prime?(_n, []), do: true
  defp _prime?(n, [h|_]) when rem(n, h) == 0, do: false
  defp _prime?(n, [_|t]), do: _prime?(n, t)

end
