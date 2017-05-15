defmodule Webscraper do
  @moduledoc """
  Documentation for Webscraper.
  """

  @doc """
    Main function that handles the processing of the response
  """
  def main(url) do
     case HTTPoison.get(url) do
      {:ok, response} ->
        case response.status_code do
          200 -> 
              response.body
              |> get_ingredients
              # |> Floki.find(".ingred-list")
              # |> Enum.map(&strip_white_space)
            {:ok}
          -> :error
        end
    end
  end

  @doc """
    Fetch ingredients from web scaper response
  """
  def get_ingredients(res) do
    ingredients = res
      |> Floki.find(".ingred-list")
      |> Enum.map(&strip_white_space/1)
      #%Webscraper.Recipe{ingredients: ingredients}

      # return response from scraper
      #res
  end

  def strip_white_space(item) do
    item
  end
end
