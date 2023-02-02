# IfElse

Conditional logic for expressions based on truthy/empty values.

## Installation

IfElse is [available in Hex](https://hex.pm/packages/if_else), the package can
be installed by adding `if_else` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:if_else, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
Interactive Elixir (1.14.0) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> import IfElse
IfElse
iex(2)> is_empty?("")
true
iex(3)> empty_else("foo", "bar")
"foo"
iex(4)> empty_else("", "bar")
"bar"
iex(5)> empty_else("", fn -> "bar" end)
"bar"
iex(6)> coalesce([false, nil, "true", false])
"true"
iex(7)> put_if(%{one: %{two: :three}}, :four, [:one, :two])
%{one: %{two: :four}}
iex(8)> put_if(%{one: %{two: :three}}, nil, [:one, :two])
%{one: %{two: :three}}
```
