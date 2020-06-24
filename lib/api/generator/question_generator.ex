defmodule Api.Generator.QuestionGenerator do
  alias Api.Generator.NumberGenerator

  @arithmetic_operators ['+', '-', '*']

  def generate_question() do
    num1 = NumberGenerator.generate_number(0, 10)
    num2 = NumberGenerator.generate_number(0, 10)
    operator = Enum.at(@arithmetic_operators, NumberGenerator.generate_number(0, 2))

    answer =
      case operator do
        '+' -> num1 + num2
        '-' -> num1 - num2
        '*' -> num1 * num2
      end

    %{text: "#{num1} #{operator} #{num2}", answer: answer}
  end
end
