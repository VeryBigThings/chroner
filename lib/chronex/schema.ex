defmodule Chronex.Schema do
  @moduledoc """
  Schema module for setting up default schema config
  """

  defmacro __using__(_) do
    quote do
      use Ecto.Schema

      @primary_key false
      @derive [Poison.Encoder]
    end
  end
end
