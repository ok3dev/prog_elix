defmodule ProgElixTest do
  use ExUnit.Case
  doctest ProgElix

  test "greets the world" do
    assert ProgElix.hello() == :world
  end
end
