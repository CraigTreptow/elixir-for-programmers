defmodule GallowsWeb.HangmanView do
  use GallowsWeb, :view
  alias GallowsWeb.Router.Helpers, as: Routes

  @responses %{
    :won          => { :success, "You won!"                  },
    :lost         => { :danger,  "You lost."                 },
    :good_guess   => { :success, "Good guess!"               },
    :bad_guess    => { :warning, "Bad guess."                },
    :already_used => { :info,    "You already guessed that." },
  }

  def game_state(state) do
    @responses[state]
    |> alert()
  end

  def alert(nil), do: ""
  def alert({class, message}) do
    """
    <div class="alert alert-#{class}">
      #{message}
    </div>
    """
    |> raw()
  end

  def word_so_far(tally) do
    tally.letters
    |> Enum.join(" ")
  end
end
