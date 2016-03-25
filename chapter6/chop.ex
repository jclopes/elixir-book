# Exercise: ModulesAndFunctions-6
defmodule Chop do

  def guess(actual, low..high) do
    _guess(actual, low..high, div(high - low, 2))
  end

  defp _guess(actual, _, actual) do
    IO.puts("Is it #{actual}")
    IO.puts(actual)
  end
  defp _guess(actual, low.._, hyp) when hyp > actual do
    IO.puts("Is it #{hyp}")
    high = hyp
    _guess(actual, low..high, low + div(high - low, 2))
  end
  defp _guess(actual, _..high, hyp) when hyp < actual do
    IO.puts("Is it #{hyp}")
    low = hyp
    _guess(actual, low..high, low + div(high - low, 2))
  end

end
