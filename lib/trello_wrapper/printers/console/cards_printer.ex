defmodule CardsPrinter do
  def print(cards) do
    IO.puts "card_name                         |                    members                        |       date_of_last_activity"
    Enum.each(cards, fn(card) -> IO.puts "#{card.name} | #{print_members(card.members)} | #{card.dateLastActivity}" end)
  end

  defp print_members([]) do
    "Do tej karty nie przypisano urzytkownikow"
  end
  defp print_members(members) do
    members
    |> Enum.map(fn(member) -> member.fullName end)
    |> Enum.join(", ")
  end
end
