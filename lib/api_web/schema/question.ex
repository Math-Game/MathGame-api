defmodule ApiWeb.Schema.Question do
  use Absinthe.Schema.Notation

  object :question do
    field(:id, :id)
    field(:text, :string)
    #    field(:answers, :)
  end
end
