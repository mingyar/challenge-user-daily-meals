defmodule Exmeal.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.Meal

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:cpf, :email, :name]

  @derive {Jason.Encoder, only: [:cpf, :id, :email, :name]}

  schema "users" do
    field(:name, :string)
    field(:cpf, :string)
    field(:email, :string)
    has_many(:meals, Meal)
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
