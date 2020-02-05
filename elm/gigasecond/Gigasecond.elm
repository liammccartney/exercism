module Gigasecond exposing (add)

import Time exposing (..)


add : Time.Posix -> Time.Posix
add timestamp =
    timestamp
        |> posixToMillis
        |> (+) (10 ^ 12)
        |> millisToPosix
