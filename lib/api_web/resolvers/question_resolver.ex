defmodule ApiWeb.Resolvers.QuestionResolver do
  alias Api.Generator.{QuestionGenerator, NumberGenerator}
  alias Api.Questions

  defp get_question() do
    question = QuestionGenerator.generate_question()

    db_result =
      question
      |> Map.get(:text)
      |> Questions.get_question_by_text()

    cond do
      db_result == nil ->
        %{
          answer: Map.get(question, :answer),
          text: Map.get(question, :text)
        }
        |> Questions.create_question()

        question
        |> Map.get(:text)
        |> Questions.get_question_by_text()

      db_result != nil ->
        db_result
    end
  end

  defp get_questions(array \\ [], count \\ 0) do
    case count < 100 do
      true ->
        [get_question() | array]
        |> get_questions(count + 1)

      false ->
        array
    end
  end

  def questions(id, text) do
    {:ok, get_questions()}
  end
end
