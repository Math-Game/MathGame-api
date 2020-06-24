defmodule ApiWeb.Resolvers.QuestionResolver do
  alias Api.Generator.{QuestionGenerator, NumberGenerator}
  alias Api.Questions

  def questions(id, text) do
    question = QuestionGenerator.generate_question()

    question =
      case {
        question
        |> Map.get(:text)
        |> Questions.get_question_by_text(),
        question
      } do
        {nill, original} ->
          %{
            answer: Map.get(original, :answer),
            text: Map.get(original, :text)
          }
          |> Questions.create_question()

        {res} ->
          res
      end

    {:ok, [question]}
  end
end
