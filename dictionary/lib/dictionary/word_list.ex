defmodule Dictionary.WordList do

  def start() do
    word_list()
  end

  def random_word(word_list) do
    word_list
    |> Enum.random()
  end

  def word_list() do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> IO.inspect
    |> File.read!()
    |> String.split(~r/\n/)
  end
end
