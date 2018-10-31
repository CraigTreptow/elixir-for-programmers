defmodule GallowsWeb.HangmanView do
  use GallowsWeb, :view
  alias GallowsWeb.Router.Helpers, as: Routes

  def word_so_far(tally) do
    tally.letters
    |> Enum.join(" ")
  end
end
