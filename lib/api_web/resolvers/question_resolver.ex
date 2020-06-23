defmodule ApiWeb.Resolvers.QuestionResolver do
  alias Api.Questions

  def questions(id, text) do
    Questions.create_question(%{text: "1 + 1"})
    {:ok, Questions.list_questions()}
  end
end
