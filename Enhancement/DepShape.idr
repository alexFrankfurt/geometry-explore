module DepShape

data Line = Li

data Point = Po

data Segment = Se

data RelationType = On
                  | Intersect
                  | NotIntersect
                  | TheSame
                  | Parallel
                  
-- class Shape z where

-- instance Shape Line where

-- instance Shape Segment where

-- instance Shape Point where

data Shape : (a : Type) -> (figure : a) -> Type where
  MkPo : Double -> Double -> Shape Point Po
  MkLi : Point -> Point -> Shape Line Li
  MkSe : Point -> Point -> Shape Segment Se
  
relate : (Shape a b) -> String
relate (MkPo x y)  = "po"
relate (MkLi x y)  = "li"
relate (MkSe x y)  = "se"
