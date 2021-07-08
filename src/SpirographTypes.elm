module SpirographTypes exposing(..)

type Msg
  = Speed1 Float
  | Speed2 Float
  | Radius1 Float
  | Radius2 Float

type alias Circle =
    { radius : Float
    , speed : Float
    }

type alias Model =
  { circle1: Circle
  , circle2: Circle }
