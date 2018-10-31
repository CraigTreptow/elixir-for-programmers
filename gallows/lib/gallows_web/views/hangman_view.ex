defmodule GallowsWeb.HangmanView do
  use GallowsWeb, :view
  import GallowsWeb.Helpers.Views.GameStateHelper
  alias GallowsWeb.Router.Helpers, as: Routes

  def game_over?(%{ game_state: game_state }) do
    game_state in [:won, :lost]
  end

  def new_game_button(conn) do
    button("New Game", to: Routes.hangman_path(conn, :create_game))
  end

  def used_letters(tally) do
    tally.used
    |> Enum.join(" ")
  end

  def word_so_far(tally) do
    tally.letters
    |> Enum.join(" ")
  end
end
