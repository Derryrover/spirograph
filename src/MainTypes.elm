module MainTypes exposing (..)

import SpirographTypes


type alias Model =
   { spirograph1: SpirographTypes.Model--SpirographModule.Model--SpirographModel
   , spirograph2: SpirographTypes.Model
   , samples: Int
   , timingRecord: TimingRecord}

type Msg
    = Frame Float | SpirographMsg1 SpirographTypes.Msg | SpirographMsg2 SpirographTypes.Msg

type Direction = To | Back

type alias TimingRecord =
  { timeIntervals: Int
  , currentTimeInterval : Int
  , animationDirection : Direction}
