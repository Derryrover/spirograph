module Spirograph exposing (..)

import MainTypes exposing(..)
import SinCos

calculateCoordinate: Float -> Circle -> Circle -> (Int,Int)
calculateCoordinate fraction circle1 circle2 =
  let
    x = (SinCos.singleCircleSin fraction circle1) + (SinCos.singleCircleSin fraction circle2)
    y = (SinCos.singleCircleCos fraction circle1) + (SinCos.singleCircleCos fraction circle2)
  in
    (round x, round y)

--calculateCoordinateList: List Float -> Circle -> Circle -> List (Int, Int)--List Int
calculateCoordinateList: List Float -> Circle -> Circle -> List Int
calculateCoordinateList fractions circle1 circle2 =
    --List.map (\frac-> calculateCoordinate frac circle1 circle2) fractions
    let tuplesList = List.map (\frac-> calculateCoordinate frac circle1 circle2) fractions
    in List.foldl foldFunc [] tuplesList

foldFunc: (Int,Int) -> List Int -> List Int
foldFunc (x,y) listInt = List.concat [listInt, [x,y]]
