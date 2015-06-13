module Animation

import Data
import Data.Vect
import Prerequisites

record InitState (n : Nat) where
  constructor MkInitState
  pts : Vect n a

is : InitState 3
is = MkInitState [1, 2, 3]

record State (n : Nat) where
  constructor MkState
  pts : Vect n a
  cls : Pair a a
  
st : State 3
st = MkState [basePoint, basePoint, basePoint] (basePoint, point11)

p : Point
p = fst $ cls st

data Direction = MkDirection Double Double

record Activity (n : Nat) where
  constructor MkAnimation
  st : State n
  ds : Vect n Direction
