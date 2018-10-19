defmodule HangmanGameTest do
  use ExUnit.Case
  doctest Hangman.Game

  alias Hangman.Game

  test "new_game returns a structure" do
    game =  Game.new_game()

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
    assert Enum.all?(game.letters, fn ch -> ch =~ ~r/[a-z]/ end)
  end

  test "state isn't changed for :won or :lost game" do
    for state <- [:won, :lost] do
      game = Game.new_game()
             |> Map.put(:game_state, state)

      # pin game, so this only matches if both games are the same
      assert { ^game, _ } = Game.make_move(game, "x")
    end
  end

  test "first occurrence of letter is not already used" do
    game = Game.new_game()
    { game, _tally } = Game.make_move(game, "x")
    assert game.game_state  != :already_used
  end

  test "second occurrence of letter is not already used" do
    game = Game.new_game()
    { game, _tally } = Game.make_move(game, "x")
    assert game.game_state  != :already_used
    { game, _tally } = Game.make_move(game, "x")
    assert game.game_state  == :already_used
  end

  test "a good guess is recognized" do
    game = Game.new_game("wibble")
    { game, _tally } = Game.make_move(game, "w")
    assert game.game_state  == :good_guess
    assert game.turns_left == 7
  end

  test "a guessed word is a won game" do
    game = Game.new_game("wibble")
    { game, _tally } = Game.make_move(game, "w")
    assert game.game_state  == :good_guess
    assert game.turns_left == 7
    { game, _tally } = Game.make_move(game, "i")
    assert game.game_state  == :good_guess
    assert game.turns_left == 7
    { game, _tally } = Game.make_move(game, "b")
    assert game.game_state  == :good_guess
    assert game.turns_left == 7
    { game, _tally } = Game.make_move(game, "l")
    assert game.game_state  == :good_guess
    assert game.turns_left == 7
    { game, _tally } = Game.make_move(game, "e")
    assert game.game_state  == :won
    assert game.turns_left == 7
  end

  test "a bad guess is recognized" do
    game = Game.new_game("wibble")
    { game, _tally } = Game.make_move(game, "q")
    assert game.game_state  == :bad_guess
    assert game.turns_left  == 6
  end

  test "a lost game is recognized" do
    game = Game.new_game("w")
    { game, _tally } = Game.make_move(game, "a")
    assert game.game_state  == :bad_guess
    assert game.turns_left  == 6
    { game, _tally } = Game.make_move(game, "b")
    assert game.game_state  == :bad_guess
    assert game.turns_left  == 5
    { game, _tally } = Game.make_move(game, "c")
    assert game.game_state  == :bad_guess
    assert game.turns_left  == 4
    { game, _tally } = Game.make_move(game, "d")
    assert game.game_state  == :bad_guess
    assert game.turns_left  == 3
    { game, _tally } = Game.make_move(game, "e")
    assert game.game_state  == :bad_guess
    assert game.turns_left  == 2
    { game, _tally } = Game.make_move(game, "f")
    assert game.game_state  == :bad_guess
    assert game.turns_left  == 1
    { game, _tally } = Game.make_move(game, "g")
    assert game.game_state  == :lost
  end

  #test "a new technique" do
    #moves = [
      #{"w", :good_guess},
      #{"i", :good_guess},
      #{"b", :good_guess},
      #{"l", :good_guess},
      #{"e", :won}
    #]

    #game = Game.new_game("wibble")
#
    #for {guess, state} <- moves do
      #game = Game.make_move(game, guess)
      #assert game.game_state == state
    #end
  #end

  test "a guessed word is a won game - better technique" do
    moves = [
      {"w", :good_guess},
      {"i", :good_guess},
      {"b", :good_guess},
      {"b", :already_used},
      {"l", :good_guess},
      {"e", :won},
    ]

    game = Game.new_game("wibble")

    fun = fn ({ guess, state }, game) ->
            { game, _tally} = Game.make_move(game, guess)
            assert game.game_state == state
            game
          end

    Enum.reduce(moves, game, fun)
  end
end
