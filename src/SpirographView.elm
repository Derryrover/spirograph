module SpirographView exposing (..)

import SpirographTypes exposing(..)
import Html exposing (Html, input)
import Html.Attributes exposing (width, height, placeholder, type_)
import Html.Events exposing(onInput)
import Html.Events.Extra exposing (targetValueFloat)
import Result exposing(..)

inputToFloat: String -> Msg
inputToFloat str =
  let
    fl1 = String.toFloat str
  in
    case fl1 of
      Ok fl2 ->
        Speed2 fl2
      Err _ ->
        Speed2 0.0

inputToFloatWithMessage: (Float -> SpirographTypes.Msg) -> String -> Msg
inputToFloatWithMessage msgFunc str =
  let
    fl1 = String.toFloat str
  in
    case fl1 of
      Ok fl2 ->
        msgFunc fl2
      Err _ ->
        msgFunc 0.0

view: Model -> Html.Html Msg
view =
    (\model ->
        Html.div []
        [ Html.label [Html.Attributes.style [ ("color", "white")]] [Html.text "speed1"]
        , Html.input [ onInput (inputToFloatWithMessage Speed1)--Speed2 targetValueFloat
                     , type_ "number"
                     , placeholder (toString model.circle1.speed)] []
        , Html.label [Html.Attributes.style [ ("color", "white")]] [Html.text "radius1"]
        , Html.input [ onInput (inputToFloatWithMessage Radius1)--Speed2 targetValueFloat
                     , type_ "number"
                     , placeholder (toString model.circle1.radius)] []
        , Html.label [Html.Attributes.style [ ("color", "white")]] [Html.text "speed2"]
        , Html.input [ onInput (inputToFloatWithMessage Speed2)--Speed2 targetValueFloat
                     , type_ "number"
                     , placeholder (toString model.circle2.speed)] []
        , Html.label [Html.Attributes.style [ ("color", "white")]] [Html.text "radius2"]
        , Html.input [ onInput (inputToFloatWithMessage Radius2)--Speed2 targetValueFloat
                     , type_ "number"
                     , placeholder (toString model.circle2.radius)] [] ]
    )
