defmodule IfElseTest do
  use ExUnit.Case

  import IfElse

  test "is_empty?/1" do
    assert is_empty?(nil)
    assert is_empty?("")
    refute is_empty?("something")
  end

  test "empty_else/2" do
    assert 3 == empty_else(3, 4)
    assert 4 == empty_else(nil, 4)
    assert 4 == empty_else("", 4)
    assert "zero" == empty_else("zero", fn -> "one" end)
    assert "one" == empty_else(nil, fn -> "one" end)
    assert "one" == empty_else("one", fn -> "two" end)
    assert "two" == empty_else("", fn -> "two" end)
  end

  test "coalesce/1" do
    assert "true" == coalesce([false, nil, "true", false])
    assert 3 == coalesce([false, 3, "true", false])
    assert nil == coalesce([false, nil, nil, false])
    assert true == coalesce([false, nil, true, false])
  end

  test "put_if/1" do
    assert %{one: %{two: :four}} == put_if(%{one: %{two: :three}}, :four, [:one, :two])
    assert %{one: %{two: :three}} == put_if(%{one: %{two: :three}}, nil, [:one, :two])
  end
end
