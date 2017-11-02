module SpirographState exposing(..)

import SpirographTypes exposing(..)
import SpirographInit exposing(..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
   case msg of
     Speed1 fl ->
       --(model, Cmd.none)
       let
         circle1 = model.circle1
         circle1Updated = {circle1 | speed = fl}
      in
       ({model | circle1 = circle1Updated}, Cmd.none)
     Speed2 fl ->
       let
         circle2 = model.circle2
         circle2Updated = {circle2 | speed = fl}
       in
         ({model | circle2 = circle2Updated}, Cmd.none)
     Radius1 fl ->
      let
        circle1 = model.circle1
        circle1Updated = {circle1 | radius = fl}
      in
        ({model | circle1 = circle1Updated}, Cmd.none)
     Radius2 fl ->
      let
        circle2 = model.circle2
        circle2Updated = {circle2 | radius = fl}
      in
        ({model | circle2 = circle2Updated}, Cmd.none)

init: Bool -> ( Model, Cmd Msg )
init bool =
  case bool of
    False ->
      (spirograph1, Cmd.none)
    True ->
      (spirograph2, Cmd.none)
