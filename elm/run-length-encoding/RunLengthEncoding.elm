module RunLengthEncoding exposing (decode, encode)

import Char
import Regex exposing (Regex)
import Tuple


encodeAux string acc =
    case String.slice 0 1 string of
        "" ->
            acc
        substr ->
            encodeAux (String.dropLeft 1 string) (Tuple


encode : String -> String
encode string =
    string
        |> Debug.todo "lol"


decode : String -> String
decode string =
    string
        |> Debug.todo "finish"
