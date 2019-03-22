module SpaceAge exposing (Planet(..), ageOn)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


yearInSeconds : Float
yearInSeconds =
    365.25 * 24 * 60 * 60


earthYearsToOtherPlanet : Planet -> Float -> Float
earthYearsToOtherPlanet planet years =
    case planet of
        Mercury ->
            years / 0.2408467

        Venus ->
            years / 0.61519726

        Earth ->
            years / 1

        Mars ->
            years / 1.8808158

        Jupiter ->
            years / 11.862615

        Saturn ->
            years / 29.447498

        Uranus ->
            years / 84.016846

        Neptune ->
            years / 164.79132


ageOn : Planet -> Float -> Float
ageOn planet seconds =
    earthYearsToOtherPlanet planet (seconds / yearInSeconds)
