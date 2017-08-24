defmodule Card do
  defstruct [id: "", name: "", dateLastActivity: DateTime.to_string(DateTime.utc_now()), members: []]

  def get_cards(board_id, downloader) do
    get_cards_simple(board_id, downloader)
    |> Enum.map(fn(card) -> %{card | members: Member.get_members(card.id, downloader)} end)
    |> Enum.sort(fn(a, b) -> a.dateLastActivity >= b.dateLastActivity end)
  end

  def count(board_id, downloader) do
    get_cards_simple(board_id, downloader)
    |> Enum.count
  end

  def get_date_of_last_activity(board_id, downloader) do
    card = get_cards_simple(board_id, downloader)
    |> Enum.at(0, %Card{})

    card.dateLastActivity
  end

  defp get_cards_simple(board_id, downloader) do
    downloader.("https://api.trello.com/1/boards/#{board_id}/cards?key=#{TrelloWrapper.api_key}&token=#{TrelloWrapper.token}")
    |> Poison.decode!(as: [%Card{}])
  end
end
