defmodule Member do
  defstruct [fullName: ""]

  def get_members(card_id, downloader) do
    response = downloader.("https://api.trello.com/1/cards/#{card_id}/members?key=#{TrelloWrapper.api_key}&token=#{TrelloWrapper.token}")
    Poison.decode!(response, as: [%Member{}])
  end
end
