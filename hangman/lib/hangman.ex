defmodule Hangman do
  # public API only

  #alias Hangman.Game, as: Wombat
  # Leave the as: part off and the alias is just Game
  alias Hangman.Game

  defdelegate new_game(),  to: Game
  defdelegate tally(game), to: Game

  def make_move(game, guess) do
    Game.make_move(game, guess)
    { game, tally(game) }
  end
end
