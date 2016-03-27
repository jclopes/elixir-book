# Exercise: ModulesAndFunctions-1
defmodule Times do
  def double(n) do
    n * 2
  end

  def triple(n) do
    n * 3
  end

# Exercise: ModulesAndFunctions-4
  def quadruple(n) do
    double(double(n))
  end
end
