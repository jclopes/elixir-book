defmodule Math do

	# Exercise: ModulesAndFunctions-4
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)

	# Exercise: ModulesAndFunctions-5
	def gdc(x, 0), do: x
  def gdc(x, y), do: gdc(y, rem(x, y))

end
