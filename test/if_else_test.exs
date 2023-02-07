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

  test "empty_else/3" do
    assert 4 == empty_else(3, 4, 5)
    assert 5 == empty_else(nil, 4, 5)
    assert 5 == empty_else("", 4, 5)
    assert 0 == empty_else("zero", fn "zero" -> 0 end, fn -> "one" end)
    assert "one" == empty_else(nil, fn "zero" -> 0 end, fn -> "one" end)
    assert "one" == empty_else("", fn "zero" -> 0 end, fn -> "one" end)
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

  test "call_if/3" do
    assert "one" == call_if("one", nil, fn "one", _arg2 -> raise "nope" end)
    assert "one" == call_if("one", false, fn "one", _arg2 -> raise "nope" end)
    assert "three" == call_if("one", "two", fn "one", "two" -> "three" end)
    assert "one" == call_if("one", fn "one" -> "" end, fn "one", "two" -> "three" end)
    assert "three" == call_if("one", fn "one" -> "two" end, fn "one", "two" -> "three" end)
  end
end
