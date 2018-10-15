defmodule Swapper do

  def swap( {a,b} ) do
   {b,a}
  end 

  #mine
  #def same(a,b) do
    #a == b
  #end

  def same?(a, a), do: true
  def same?(_a, _b), do: false

end
