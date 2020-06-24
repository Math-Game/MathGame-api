defmodule ApiWeb.Schema.Question do
  use Absinthe.Schema.Notation

  object :question do
    field(:id, :id)
    field(:text, :string)
    field(:answer, :string)
    field(:false_answers, list_of(:integer))
  end
end
