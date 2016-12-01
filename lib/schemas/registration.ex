defmodule E2P.Registration do
  use Ecto.Schema
  import Ecto.Changeset

  # Database	<->	Ecto	schema	<->	Forms	/	API
  embedded_schema do
    field :first_name
    field :last_name
    field :email
  end

  @doc """
  Cast params, validations.
  """
  def changeset(struct, params \\ %{}) do
    struct # Struct i.e %E2P.Registration{}
    |> cast(params, [:first_name, :last_name, :email])
    |> validate_required([:first_name, :last_name, :email])
    |> validate_length(:first_name, min: 3, max: 30)
    |> validate_length(:last_name, min: 3, max: 30)
    |> validate_length(:email, min: 5, max: 25)
  end

  @doc """
    Functions to split the attributes accordingly
  """
  def to_account(registration) do
    Map.take(registration, [:email])
  end

  def to_profile(%{first_name: first, last_name: last}) do
    %{name: "#{first} #{last}"}
  end
end
