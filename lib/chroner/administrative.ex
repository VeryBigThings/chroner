defmodule Chroner.Administrative do
  @moduledoc """
  Create and manage administrative resources.
  """

  alias __MODULE__.{Doctor, User, UserGroup}

  use Chroner.CRUD,
    import: [
      doctors: {Doctor, [:read, :list]},
      user_groups: {UserGroup, [:read]},
      users: {User, [:list, :read, :current]}
    ]
end
