defmodule Bob do
  def hey(input) do
    cond do
      is_silence?(input) -> "Fine. Be that way!"
      is_shouting?(input) and is_question?(input) ->
        "Calm down, I know what I'm doing!"
      is_shouting?(input) -> "Whoa, chill out!"
      is_question?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  defp is_shouting?(phrase) do
    letters = String.replace(phrase, ~r/[^\p{L}]/, "")
    String.length(letters) > 0 and String.upcase(letters) === letters
  end

  defp is_question?(phrase) do
    String.ends_with?(phrase, "?")
  end

  defp is_silence?(phrase) do
    String.trim(phrase) === ""
  end
end
