defmodule Attributes do
  @author "Turtle"
  @attr "first"

  def get_author, do: @author

  def get_first_attr, do: @attr

  @attr "second"
  def get_second_attr, do: @attr
end
