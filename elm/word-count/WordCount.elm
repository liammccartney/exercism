module WordCount exposing (wordCount)

import Dict exposing (Dict)
import List
import Regex


punctuation : Regex.Regex
punctuation =
    Maybe.withDefault Regex.never <|
        Regex.fromString "[^a-zA-Z0-9\\s]+"


reduct : String -> Dict String Int -> Dict String Int
reduct word acc =
    Dict.update word update acc


update : Maybe Int -> Maybe Int
update count =
    case count of
        Nothing ->
            Just 1

        Just x ->
            Just (x + 1)


wordCount : String -> Dict String Int
wordCount sentence =
    sentence
        |> String.toLower
        |> Regex.replace punctuation (\_ -> "")
        |> String.split " "
        |> List.filter (\word -> String.length word > 0)
        |> List.foldl reduct Dict.empty
