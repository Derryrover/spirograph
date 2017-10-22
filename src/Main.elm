module Main exposing (..)

import MainTypes exposing (Model, Msg(..))
import MainView exposing (view)
import MainState exposing (init, subscriptions, update)
import Html


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , subscriptions = subscriptions
        , update = update
        }
