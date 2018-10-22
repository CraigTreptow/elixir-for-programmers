defmodule Dictionary do
  # public API

  alias Dictionary.WordList

  defdelegate start(),                to: WordList
  defdelegate random_word(word_list), to: WordList

end
