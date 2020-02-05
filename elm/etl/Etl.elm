module Etl exposing (transform)

import Dict exposing (Dict)


aux : Int -> List String -> Dict String Int -> Dict String Int
aux point letters acc =
    case letters of
        [] ->
            acc
        letter::tail ->
            aux point tail (Dict.insert (String.toLower letter) point acc)




transform : Dict Int (List String) -> Dict String Int
transform input =
    Dict.foldl aux Dict.empty input
