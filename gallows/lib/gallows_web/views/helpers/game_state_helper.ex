defmodule GallowsWeb.Helpers.Views.GameStateHelper do

  import Phoenix.HTML, only: [ raw: 1 ]

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
    <div class="alert alert-#{class}" role="alert">
      #{message}
    </div>
    """
    |> raw()
  end
end
