defmodule Lists do
  def len([]),              do: 0
  def len([ _head | tail]), do: 1 + len(tail)

  def sum([]),                 do: 0
  def sum([ head | tail]), do: head + sum(tail)

  def double([]),              do: []
  def double([ head | tail ]), do: [ 2*head | double(tail) ]

  def square([]),              do: []
  def square([ head | tail ]), do: [ head*head | square(tail) ]

  def sum_pairs([]),            do: []
  def sum_pairs([ h1, h2 | t]), do: [ h1 + h2 | sum_pairs(t) ]

  # TODO
  #def even_length?( [] ),             do: false
  #def even_length?( [_a | []] ),      do: false
  #def even_length?( [_a, _b | []] ),  do: true
  #def even_length?( [head | tail ] ), do: even_length?(tail)

  #This answer: https://elixirforum.com/t/pattern-matching-question-related-to-sum-of-pairs-from-dave-thomas-elixir-for-programmers-course/13991/2

  #@spec sum_pairs([integer]) :: [integer]
  #def sum_pairs([]), do: []
  #def sum_pairs([_unpaired_element] = t), do: t # [_unpaired_element + 0] or drop it: []
  #def sum_pairs([h1, h2 | t]), do: [h1 + h2 | sum_pairs(t)]

  # https://gist.github.com/mauricioabreu/8fdb64bef6a938dd1e34ac15e9268d4d
  # Write a function even_length? that uses pattern matching only to return false 
  # if the list you pass it has an odd number of elements, true otherwise.

  def even_length?([_, _ | t]), do: even_length?(t)
  def even_length?([_ | []]),   do: false
  def even_length?([]),         do: true
end
