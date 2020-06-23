defmodule ApiWeb.Schema do
  use Absinthe.Schema

  alias ApiWeb.Resolvers
  alias ApiWeb.Schema

  import_types(Schema.Question)

  query do
    @desc "Get a set of questions"
    field :questions, list_of(:question) do
      resolve(&Resolvers.QuestionResolver.questions/2)
    end
  end

  #  mutation do
  #  end
end
