defmodule BaliTest do
  use ExUnit.Case
  doctest Bali

  test "greets the world" do
    assert Bali.hello() == :world
  end
end
