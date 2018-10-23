defmodule Dictionary do
  # public API

  alias Dictionary.WordList

  defdelegate start_link(),           to: WordList
  defdelegate random_word(agent_pid), to: WordList

end
