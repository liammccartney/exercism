module Hamming exposing (distance)


calcDistance : List String -> List String -> Int -> Result String Int
calcDistance left right dist =
    case ( left, right ) of
        ( [], [] ) ->
            Ok dist

        ( [], _ :: _ ) ->
            Err "left and right strands must be of equal length"

        ( _ :: _, [] ) ->
            Err "left and right strands must be of equal length"

        ( hdL :: tlL, hdR :: tlR ) ->
            if hdL /= hdR then
                calcDistance tlL tlR (dist + 1)

            else
                calcDistance tlL tlR dist


distance : String -> String -> Result String Int
distance left right =
    calcDistance (String.split "" left) (String.split "" right) 0
