input = """
BEER 1.99
Glenn 5 9.95
Schwerin 1 1.99
Glenn 5 8.95
Dave 100 5
Schwerin 2 5.97
"""

["BEER " <> price | lines] = String.split(input, "\n", trim: true)
{price, ""} = Float.parse(price)

parse_line = fn line ->
  [name, number, amount] = String.split(line, " ")
  {number, ""} = Integer.parse(number)
  {amount, ""} = Float.parse(amount)
  {name, number, amount}
end

lines
|> Enum.reduce(%{}, fn line, owed ->
  {name, number, amount} = parse_line.(line)

  case number * price - amount do
    overpaid when overpaid <= 0.0 -> owed
    underpaid -> Map.update(owed, name, underpaid, & &1 + underpaid)
  end
end)
|> Enum.each(fn {name, owed} ->
  IO.puts "#{name} owes #{owed}"
end)
