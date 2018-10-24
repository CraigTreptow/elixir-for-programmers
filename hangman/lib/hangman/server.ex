defmodule Hangman.Server do
  alias Hangman.Game
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    # the state of our server is defined by the result of this call
    { :ok, Game.new_game() }
  end

  # GenServer.call(pid, { :make_move, "a" })
  def handle_call({ :make_move, guess }, _from, game) do
    { game, tally } = Game.make_move(game, guess)
    { :reply, tally, game }
  end
end
