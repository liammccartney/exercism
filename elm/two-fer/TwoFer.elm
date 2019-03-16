module TwoFer exposing (twoFer)


twoFer : Maybe String -> String
twoFer name =
    let pronoun =
            case name of
                Nothing ->
                    "you"
                Just n ->
                    n
    in
        "One for " ++ pronoun ++ ", one for me."
