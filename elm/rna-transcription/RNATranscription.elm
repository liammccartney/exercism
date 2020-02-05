module RNATranscription exposing (toRNA)

import Dict
import Result exposing (..)
import String


transform : Char -> Char
transform x =
    case x of
        'G' ->
            'C'

        'C' ->
            'G'

        'T' ->
            'A'

        'A' ->
            'U'

        _ ->
            x


toRNA : String -> Result Char String
toRNA dna =
    dna
        |> String.map transform
        |> Ok
