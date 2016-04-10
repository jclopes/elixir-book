defmodule BookTax do

  # Exercise: ListsAndRecursion-8
  def tax_rates, do: [ NC: 0.075, TX: 0.08 ]

  def orders do
    [
      [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 124, ship_to: :OK, net_amount:  35.50 ],
      [ id: 125, ship_to: :TX, net_amount:  24.00 ],
      [ id: 126, ship_to: :TX, net_amount:  44.80 ],
      [ id: 127, ship_to: :NC, net_amount:  25.00 ],
      [ id: 128, ship_to: :MA, net_amount:  10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ id: 130, ship_to: :NC, net_amount:  50.00 ]
    ]
  end

  def add_total_amount(orders, tax_rates) do
    Enum.map(orders, &(_add_total_amount(&1, tax_rates)))
  end

  defp _add_total_amount(order, tax_rates) do
    ship_to = order[:ship_to]
    net_amount = order[:net_amount]
    if Keyword.has_key?(tax_rates, ship_to) do
      Keyword.put(order, :total_amount, net_amount * (tax_rates[ship_to]+1))
    else
      Keyword.put(order, :total_amount, net_amount)
    end
  end

end
