defmodule IfElse do
  @moduledoc """
  Functions providing conditional logic.
  """

  @doc """
  Check for empty strings, where empty is nil or `""`.
  """
  @spec is_empty?(nil | String.t()) :: true | false
  def is_empty?(nil), do: true
  def is_empty?(""), do: true
  def is_empty?(_), do: false

  @doc """
  If the `value` is `nil` or an empty string, return the `else_value`.
  Otherwise, return the value.

  If `else_value` is a function, it is called.
  """
  @spec empty_else(value :: nil | String.t() | any(), else_value :: (() -> any()) | any()) :: any()
  def empty_else(nil, else_value) when is_function(else_value), do: else_value.()
  def empty_else("", else_value) when is_function(else_value), do: else_value.()
  def empty_else(nil, else_value), do: else_value
  def empty_else("", else_value), do: else_value
  def empty_else(value, _else_value), do: value

  @doc """
  Return the first truthy element in the list, otherwise return nil.
  """
  @spec coalesce(list()) :: nil | any()
  def coalesce([]), do: nil
  def coalesce([hd | list]), do: hd || coalesce(list)

  @doc """
  If `value` is truthy, put it in the structure at `path` and return the updated
  structure. Otherwise return the structure unchanged.
  """
  @spec put_if(structure :: Access.t(), value :: function() | any(), path :: list()) :: Access.t()
  def put_if(structure, nil, _path), do: structure
  def put_if(structure, false, _path), do: structure
  def put_if(structure, value, path) when is_function(value), do: put_in(structure, path, value.())
  def put_if(structure, value, path), do: put_in(structure, path, value)

  @doc """
  Call the two argument `function` with `arg1` and `arg2` if `arg2` is truthy.
  """
  @spec call_if(arg1 :: any(), arg2 :: nil | false | any(), function :: (any(), any() -> any())) :: any()
  def call_if(arg1, nil, _function), do: arg1
  def call_if(arg1, false, _function), do: arg1
  def call_if(arg1, arg2, function), do: function.(arg1, arg2)
end
