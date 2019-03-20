module RobotSimulator exposing
    ( Bearing(..)
    , Robot
    , advance
    , defaultRobot
    , simulate
    , turnLeft
    , turnRight
    )


type Bearing
    = North
    | East
    | South
    | West


type alias Robot =
    { bearing : Bearing
    , coordinates : { x : Int, y : Int }
    }


defaultRobot : Robot
defaultRobot =
    Debug.todo "Please implement this function"


turnRight : Robot -> Robot
turnRight robot =
    Debug.todo "Please implement this function"


turnLeft : Robot -> Robot
turnLeft robot =
    Debug.todo "Please implement this function"


advance : Robot -> Robot
advance robot =
    Debug.todo "Please implement this function"


simulate : String -> Robot -> Robot
simulate directions robot =
    Debug.todo "Please implement this function"
