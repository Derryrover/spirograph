module MainTypes exposing (..)

type alias Model =
   { spirograph1: SpirographModel
   , spirograph2: SpirographModel
   , samples: Int
   , timingRecord: TimingRecord}

{-
    { circle1 : Circle
    , circle2 : Circle
    , samples : Int
    }
-}

type alias Circle =
    { radius : Int
    , speed : Float
    }

type Msg
    = Frame Float

type Direction = To | Back

type alias SpirographModel =
  { circle1: Circle
  , circle2: Circle }

type alias TimingRecord =
  { timeIntervals: Int
  , currentTimeInterval : Int
  , animationDirection : Direction}
