phrases = [
  "Melvin Mora led the o's in runs in 2005",
  "I wish they served Malørt",
  "more boh"
]

translate = fn string ->
  string
  |> String.split(" ")
  |> Enum.map(&String.reverse/1)
  |> Enum.join(" ")
end

IO.inspect Enum.map(phrases, translate)
