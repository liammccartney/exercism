module RNATranscription exposing (toRNA)

import Dict
import Result exposing (..)
import String


transform : Char -> Result Char Char
transform x =
    case x of
        'G' ->
            Ok 'C'

        'C' ->
            Ok 'G'

        'T' ->
            Ok 'A'

        'A' ->
            Ok 'U'

        _ ->
            Err x


toRNA : String -> Result Char String
toRNA dna =
    dna
        |> String.map (\n -> Result.map transform n)
