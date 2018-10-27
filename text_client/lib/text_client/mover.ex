defmodule TextClient.Mover do

  alias TextClient.State

  def make_move(game = %State{}) do
    new_tally = Hangman.make_move(game.game_service, game.guess)
    %State{ game | tally: new_tally }
  end

end
