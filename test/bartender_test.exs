defmodule BartenderTest do
  use ExUnit.Case
  doctest Bartender

  test "greets the world" do
    assert Bartender.hello() == :world
  end
end
