defmodule ApiWeb.Resolvers.QuestionResolver do
  alias Api.Questions
  def questions(id, text) do
    {:ok, Questions.list_questions()}
  end
end
