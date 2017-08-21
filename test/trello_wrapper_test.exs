defmodule TrelloWrapperTest do
  use ExUnit.Case
  doctest TrelloWrapper

  test "greets boards" do
    assert TrelloWrapper.get_boards() == []
  end
end
