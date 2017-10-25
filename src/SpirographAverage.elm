module SpirographAverage exposing(..)

a = 1

circle cir1 cir2 maxi curr =
  let
    dRadius = cir2.radius - cir1.radius
    dSpeed = cir2.speed - cir1.speed
    fraction = (toFloat curr) / (toFloat maxi)
    --newRadius = cir1.radius + (round ((toFloat dRadius) * fraction))
    newRadius = cir1.radius + ( dRadius * fraction)
    newSpeed = cir1.speed + (dSpeed * fraction)
  in
    {radius = newRadius, speed = newSpeed}

spirograph spir1 spir2 maxi curr =
   let
     circle1 = circle spir1.circle1 spir2.circle1 maxi curr
     circle2 = circle spir1.circle2 spir2.circle2 maxi curr
   in
     {circle1=circle1, circle2=circle2}
