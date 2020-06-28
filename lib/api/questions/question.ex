defmodule Api.Questions.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field(:text, :string, unique: true)
    field(:answer, :integer)

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:text, :answer])
    |> validate_required([:text, :answer])
    |> unique_constraint([:text])
  end
end
