module MainView exposing (..)

import MainTypes exposing (Model, Msg(..))
import Html exposing (Html, input)
import Html.Attributes exposing (width, height, type_)
import Html.Events exposing (onClick)

view =
    (\model ->
        Html.div [] []--[Html.text "test html"]
    )
