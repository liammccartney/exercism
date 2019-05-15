module SumOfMultiples exposing (multiplesBelow, sumOfMultiples)


multiplesBelow : List Int -> Int -> List Int
multiplesBelow divisors limit =
    let
        aux n acc =
            if n == 0 then
                acc

            else if List.any (dividesInto n) divisors then
                aux (n - 1) (n :: acc)

            else
                aux (n - 1) acc
    in
    aux limit []


dividesInto : Int -> Int -> Bool
dividesInto x y =
    modBy y x == 0


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples multiples limit =
    List.sum (multiplesBelow multiples (limit - 1))
