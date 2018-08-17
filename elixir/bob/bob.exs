defmodule Bob do
  def hey(input) do
    letters = String.replace(input, ~r/[^a-zA-Z]/, "")
    IO.puts(letters)
    cond do
      String.trim(input) === "" ->
        "Fine. Be that way!"
      String.upcase(letters) === letters and String.ends_with?(input, "?") ->
        "Calm down, I know what I'm doing!"
      String.upcase(letters) === letters ->
        "Whoa, chill out!"
      String.ends_with?(input, "?") ->
        "Sure."
      true -> 
        "Whatever."
    end
  end
end
