module MainView exposing (..)

import MainTypes exposing (Model, Msg(..))
import SpirographView
import Html exposing (Html, input)
import Html.Attributes exposing (width, height, type_)
import Html.Events exposing (onClick)

view: Model -> Html.Html Msg
view =
    (\model ->
        Html.div []
          [ Html.map SpirographMsg1 (SpirographView.view model.spirograph1)
          , Html.map SpirographMsg2 (SpirographView.view model.spirograph2) ]
    )
