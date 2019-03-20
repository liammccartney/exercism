module RunLengthEncoding exposing (decode, encode)

import Char
import Regex exposing (Regex)
import Tuple


extractMatch : Regex.Match -> String
extractMatch match =
    if String.length match.match > 1 then
        String.fromInt (String.length match.match) ++ Maybe.withDefault "" (Maybe.withDefault Nothing (List.head match.submatches))

    else
        Maybe.withDefault "" (Maybe.withDefault Nothing (List.head match.submatches))


repeatedChars : Regex
repeatedChars =
    Maybe.withDefault Regex.never (Regex.fromString "(.)\\1*")


encode : String -> String
encode string =
    string
        |> Regex.find repeatedChars
        |> List.map extractMatch
        |> String.join ""


decode : String -> String
decode string =
    Debug.todo "Please implement this function"
