# http://rosalind.info/problems/fibo/

defmodule Fibo do
  def fib(0) do 0 end
  def fib(1) do 1 end
  def fib(n) do
    fib(n - 1) + fib(n-2)
  end
end

IO.puts Fibo.fib(25)
