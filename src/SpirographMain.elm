module SpirographMain exposing(..)

import SpirographTypes exposing(..)
import SpirographState
import SpirographView
import Html

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        []

update : Msg -> Model -> ( Model, Cmd Msg )
update = SpirographState.update
--update msg model = (model, Cmd.none)

init = SpirographState.init

view = SpirographView.view
{-
main : Program Never Model Msg
main =
    Html.program
        { init = init False
        , view = view
        , subscriptions = subscriptions
        , update = update
        }
-}
