defmodule Downloader do
  def download(url) do
    HTTPoison.get!(url).body
  end
end
