defmodule DemoPhoenix.Quote do
  use Ecto.Model

  schema "quotes" do
    field :saying, :string
    field :author, :string
    
    timestamps
  end

  @required_fields ~w(saying author)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
