defmodule TrelloWrapper do
  @moduledoc """
  Documentation for TrelloWrapper.
  """

  @doc """
  Get boards.

  ## Examples

      iex> TrelloWrapper.get_boards
      []

  """
  def get_boards do
    Board.get_borads
  end
end
