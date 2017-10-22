module TimeIntervalCalculator exposing(..)

import MainTypes exposing (Model, Msg(..), Direction(..))

calc {timeIntervals,currentTimeInterval,animationDirection} =
  if (currentTimeInterval == timeIntervals) && animationDirection == To then
    {timeIntervals = timeIntervals,currentTimeInterval = currentTimeInterval,animationDirection = Back}
  else if (currentTimeInterval == 0) && animationDirection == Back then
    {timeIntervals = timeIntervals,currentTimeInterval = currentTimeInterval,animationDirection = To}
  else if animationDirection == To then
    {timeIntervals = timeIntervals,currentTimeInterval = currentTimeInterval + 1,animationDirection = animationDirection}
  else
    {timeIntervals = timeIntervals,currentTimeInterval = currentTimeInterval - 1,animationDirection = animationDirection}
