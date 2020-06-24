defmodule ApiWeb.Schema do
  use Absinthe.Schema

  alias ApiWeb.Resolvers
  alias ApiWeb.Schema

  import_types(Schema.Question)

  query do
    @desc "Get a set of questions"
    field :questions, list_of(:question) do
      arg(:random, non_null(:boolean))
      arg(:amount, :integer)
      arg(:id, :integer)
      resolve(&Resolvers.QuestionResolver.questions/3)
    end
  end

  #  mutation do
  #  end
end
