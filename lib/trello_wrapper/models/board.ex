defmodule Board do
  defstruct [id: "", name: "", number_of_cards: 0, dateLastActivity: DateTime.to_string(DateTime.utc_now())]

  def get_boards(user_id, downloader) do
    downloader.("https://api.trello.com/1/members/#{user_id}/boards?key=#{TrelloWrapper.api_key}&token=#{TrelloWrapper.token}")
    |> Poison.decode!(as: [%Board{}])
    |> Enum.map(fn(board) -> update_properties(board, downloader) end)
    |> Enum.sort(fn(a, b) -> a.dateLastActivity >= b.dateLastActivity end)
  end

  defp update_properties(board, downloader) do
    number_of_cards = Card.count(board.id, downloader)
    date_of_last_activity = Card.get_date_of_last_activity(board.id, downloader)

    board = %Board{board | number_of_cards: number_of_cards}
    %Board{board | dateLastActivity: date_of_last_activity}
  end
end
