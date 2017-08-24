defmodule TrelloWrapper do
  @moduledoc """
  Documentation for TrelloWrapper.
  """
  def api_key, do: System.get_env("trello_api_key")
  def token, do: System.get_env("trello_token")

  @doc """
  Display cards.

  ## Examples

      iex> TrelloWrapper.display_cards("zFmWPPv5")
      []

  """
  def display_cards(board_id) do
    Card.get_cards(board_id, &Downloader.download/1)
    |> CardsPrinter.print
  end

  @doc """
  Display boards.

  ## Examples

      iex> TrelloWrapper.display_boards("arkadiuszplichta")
      []

  """
  def display_boards(user_id) do
    Board.get_boards(user_id, &Downloader.download/1)
    |> BoardsPrinter.print
  end
end
