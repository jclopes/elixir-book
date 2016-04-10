# Exercise: ModulesAndFunctions-6
defmodule Chop do

  def guess(actual, low..high) do
    hyp = low + div(high - low, 2)
    IO.puts("Is it #{hyp}?")
    _guess(actual, low..high, hyp)
  end

  defp _guess(actual, _, actual), do: IO.puts(actual)

  defp _guess(actual, low.._, hyp) when hyp > actual do
    guess(actual, low..hyp)
  end
  defp _guess(actual, _..high, hyp) when hyp < actual do
    guess(actual, hyp..high)
  end

end
