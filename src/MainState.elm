port module MainState exposing (..)

import MainTypes exposing (Model, Msg(..), Direction(..))
import PortSendCoordinates

import SpirographMain
import SpirographTypes
import SpirographToCoordinates
import SpirographAverage
import DevideTwoPiEqual
import AnimationFrame
import TimeIntervalCalculator

init: ( Model, Cmd Msg )
init =
    ( initialModel
    , Cmd.batch
       [ PortSendCoordinates.sendCoordinates1 (makeSpiro initialModel.spirograph1 initialModel.samples)
       , PortSendCoordinates.sendCoordinates2 (makeSpiro initialModel.spirograph2 initialModel.samples)
       , PortSendCoordinates.sendCoordinates3 (makeSpiro initialModel.spirograph1 initialModel.samples)])

initialModel: Model
initialModel =
  let
    (spiro1, msg1) = SpirographMain.init True
    (spiro2, msg2) = SpirographMain.init False
  in
    { spirograph1 = spiro1
    , spirograph2 = spiro2
    , samples = 300
    , timingRecord = timingRecord
    }

makeSpiro: SpirographTypes.Model -> Int -> List Int
makeSpiro spiro samples =
   let
     sampleList = DevideTwoPiEqual.devide samples
     coordinateList = SpirographToCoordinates.calculateCoordinateList sampleList spiro.circle1 spiro.circle2
   in
     List.map (\p -> p + 200) coordinateList

timingRecord: MainTypes.TimingRecord
timingRecord =
  { timeIntervals = 600
  , currentTimeInterval = 0
  , animationDirection = To }

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Frame fl ->
      ( { model | timingRecord = TimeIntervalCalculator.calc model.timingRecord}
        , PortSendCoordinates.sendCoordinates3
          (makeSpiro (SpirographAverage.spirograph model.spirograph1 model.spirograph2 model.timingRecord.timeIntervals model.timingRecord.currentTimeInterval) model.samples))
    SpirographMsg1 spMsg ->
      let
        (spModel, spiroMsg) = SpirographMain.update spMsg model.spirograph1
      in
        ( {model | spirograph1 = spModel}
        , Cmd.batch
          [ Cmd.map SpirographMsg1 spiroMsg
          , PortSendCoordinates.sendCoordinates1 (makeSpiro spModel model.samples)])
    SpirographMsg2 spMsg ->
      let
        (spModel, spiroMsg) = SpirographMain.update spMsg model.spirograph2
      in
        ( {model | spirograph2 = spModel}
        , Cmd.batch 
          [ Cmd.map SpirographMsg2 spiroMsg
          , PortSendCoordinates.sendCoordinates2 (makeSpiro spModel model.samples)])

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [AnimationFrame.diffs Frame]
