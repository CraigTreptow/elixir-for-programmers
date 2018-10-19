defmodule Hangman.Game do

  # named same as module name
  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters:    [],
  )

  def new_game() do
    %Hangman.Game{ letters: Dictionary.random_word() |> String.codepoints }
  end

  def make_move(game = %{ game_state: :won }, _guess) do
    { game, tally(game) }
  end

  def make_move(game = %{ game_state: :lost }, _guess) do
    { game, tally(game) }
  end

  def tally(game) do
    1
  end
end
