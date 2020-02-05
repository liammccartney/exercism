module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)


sumOfN : Int -> Int
sumOfN n =
    case n of
        0 ->
            0

        _ ->
            n + sumOfN (n - 1)


squareOfSum : Int -> Int
squareOfSum n =
    sumOfN n ^ 2


sumOfSquares : Int -> Int
sumOfSquares n =
    case n of
        0 ->
            0

        _ ->
            sumOfSquares (n - 1) + (n ^ 2)


difference : Int -> Int
difference n =
    squareOfSum n - sumOfSquares n
