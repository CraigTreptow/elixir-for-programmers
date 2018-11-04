defmodule Hangman.Application do
  @moduledoc """
  This is some more module documentation
  """

  use Application

  def start( _type, _args ) do
    import Supervisor.Spec

    children = [
      worker( Hangman.Server, [ ] ),
    ]

    options = [
      name: Hangman.Supervisor,
      strategy: :simple_one_for_one,  # does NOT immediately start one
    ]

    Supervisor.start_link( children, options )
  end
end
