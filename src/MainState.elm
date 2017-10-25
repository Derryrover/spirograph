port module MainState exposing (..)

import MainTypes exposing (Model, Msg(..), Direction(..))
import PortSendCoordinates
import Spirograph
import DevideTwoPiEqual
import AnimationFrame
import TimeIntervalCalculator
import SpirographAverage

init =
    ( initialModel
    , Cmd.batch
       [ PortSendCoordinates.sendCoordinates1 (makeSpiro initialModel.spirograph1 initialModel.samples)
       , PortSendCoordinates.sendCoordinates2 (makeSpiro initialModel.spirograph2 initialModel.samples)
       , PortSendCoordinates.sendCoordinates3 (makeSpiro initialModel.spirograph1 initialModel.samples)])

{-}
initialModel =
  { circle1 = circle1
  , circle2 = circle2
  , samples = 1000
  }
-}

initialModel =
  { spirograph1 = spirograph1
  , spirograph2 = spirograph2
  , samples = 300
  , timingRecord = timingRecord
  }

makeSpiro spiro samples =
   let
     sampleList = DevideTwoPiEqual.devide samples
     coordinateList = Spirograph.calculateCoordinateList sampleList spiro.circle1 spiro.circle2
   in
     List.map (\p -> p + 200) coordinateList

timingRecord =
  { timeIntervals = 600
  , currentTimeInterval = 0
  , animationDirection = To }

circle1 =
  { radius = 40
  , speed = -31
  }

circle2 =
    { radius = 160
    , speed = 3
    }

circle3 =
  { radius = -130
  , speed = -33
  }

circle4 =
  { radius = 70
  , speed = 3
  }

spirograph1 =
  { circle1 = circle1
  , circle2 = circle2 }

spirograph2 =
  { circle1 = circle3
  , circle2 = circle4 }

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  ( { model | timingRecord = TimeIntervalCalculator.calc model.timingRecord}
    , PortSendCoordinates.sendCoordinates3
      (makeSpiro (SpirographAverage.spirograph model.spirograph1 model.spirograph2 model.timingRecord.timeIntervals model.timingRecord.currentTimeInterval) model.samples))

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [AnimationFrame.diffs Frame]
