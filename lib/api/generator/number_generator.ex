defmodule Api.Generator.NumberGenerator do
  def generate_number(min, max) do
    min = min - 1
    num = :rand.uniform(max + -min)
    num + min
  end
end
