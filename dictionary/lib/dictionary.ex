defmodule Dictionary do
  # public API

  alias Dictionary.WordList

  defdelegate random_word(), to: WordList

end
