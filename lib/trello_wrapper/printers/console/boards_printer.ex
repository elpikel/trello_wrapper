defmodule BoardsPrinter do
  def print(boards) do
    IO.puts "card_name                         |                    number_of_cards                        |       date_of_last_activity"
    Enum.each(boards, fn(board) -> IO.puts "#{board.name} | #{board.number_of_cards} | #{board.dateLastActivity}" end)
  end
end
