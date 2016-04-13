defmodule MyCsv do
  # Exercise: StringsAndBinaries-7
  def parse(filename) do
    File.stream!(filename)
    |> Stream.map(&(String.split(&1, ",")))
    |> Enum.drop(1)
    |> Enum.map(&to_keyword/1)
  end

  def to_keyword([id, ship_to, amount]) do
    {id, _} = Integer.parse(String.strip(id))
    {net_amount, _} = Float.parse(String.strip(amount))
    [id: id, ship_to: country_to_atom(ship_to), net_amount: net_amount]
  end

  def country_to_atom(":NC"), do: :NC
  def country_to_atom(":MA"), do: :MA
  def country_to_atom(":CA"), do: :CA
  def country_to_atom(":TX"), do: :TX
  def country_to_atom(":OK"), do: :OK
end
