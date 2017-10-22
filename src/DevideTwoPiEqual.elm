module DevideTwoPiEqual exposing (..)

devide: Int -> List Float
devide samples =
  let
    listInt = List.range 0 samples
    fraction = (2 * pi)/ (toFloat samples)
  in
    List.map (\p -> (toFloat p) * fraction) listInt
