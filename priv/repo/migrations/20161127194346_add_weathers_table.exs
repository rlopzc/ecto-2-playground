defmodule E2P.Repo.Migrations.AddWeathersTable do
  use Ecto.Migration

  def change do
    create table(:weather) do
      add :city,    :string, size: 40
      add :temp_lo, :integer
      add :temp_hi, :integer
      add :prcp,    :float

      timestamps
    end
  end
end
