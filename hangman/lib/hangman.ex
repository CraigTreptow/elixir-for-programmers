defmodule Hangman do
  # public API only

  #alias Hangman.Game, as: Wombat
  # Leave the as: part off and the alias is just Game
  alias Hangman.Game

  defdelegate new_game(), to: Game
end
