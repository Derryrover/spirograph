module SinCos exposing(..)

import MainTypes exposing(..)

singleCircleSin: Float -> Circle -> Float
singleCircleSin fraction circle
  =
    let
      radiusFloat = toFloat circle.radius
    in
      radiusFloat * (sin (circle.speed * fraction))

singleCircleCos: Float -> Circle -> Float
singleCircleCos fraction circle
  =
    let
      radiusFloat = toFloat circle.radius
    in
      radiusFloat * (cos (circle.speed * fraction))
