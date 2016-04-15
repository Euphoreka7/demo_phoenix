defmodule DemoPhoenix.Quote do
  use Ecto.Model

  schema "quotes" do
    field :saying, :string
    field :author, :string
    
    timestamps
  end

  @required_fields ~w(saying author)
  @optional_fields ~w()
end
