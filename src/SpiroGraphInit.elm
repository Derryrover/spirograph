module SpirographInit exposing(..)

import SpirographTypes exposing(..)

circle1: Circle
circle1 =
  { radius = 40
  , speed = -31
  }

circle2: Circle
circle2 =
    { radius = 160
    , speed = 3
    }

circle3: Circle
circle3 =
  { radius = -130
  , speed = -33
  }

circle4: Circle
circle4 =
  { radius = 70
  , speed = 3
  }

spirograph1: Model
spirograph1 =
  { circle1 = circle1
  , circle2 = circle2 }

spirograph2: Model
spirograph2 =
  { circle1 = circle3
  , circle2 = circle4 }
