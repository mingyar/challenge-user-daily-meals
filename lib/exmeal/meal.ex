defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @require_params [:date, :calories, :description, :user_id]

  @derive {Jason.Encoder, only: [:id, :calories, :date, :description, :user_id]}

  schema "meals" do
    field(:calories, :integer)
    field(:date, :date)
    field(:description, :string)
    belongs_to(:user, User)
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @require_params)
    |> validate_required(@require_params)
  end
end
