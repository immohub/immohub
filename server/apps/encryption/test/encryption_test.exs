defmodule EncryptionTest do
  use ExUnit.Case
  doctest Encryption

  test "greets the world" do
    assert Encryption.hello() == :world
  end
end
