module CollatzConjecture exposing (collatz)

import List exposing (append, length)
import Result exposing (..)


isEven : Int -> Bool
isEven n =
    modBy 2 n == 0


aux : Int -> List number -> List number
aux n acc =
    case ( n, isEven n ) of
        ( 1, _ ) ->
            acc

        ( _, True ) ->
            aux (n // 2) (1 :: acc)

        ( _, False ) ->
            aux ((3 * n) + 1) (1 :: acc)


collatz : Int -> Result String Int
collatz start =
    if start <= 0 then
        Err "Only positive numbers are allowed"

    else
        Ok (length (aux start []))
