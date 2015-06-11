module Relate

data RelationType = On
                  | Intersect
                  | NotIntersect
                  | TheSame
                  | Parallel
                  
pointPointImpl : Point -> Point -> RelationType
pointPointImpl (MkPoint a b) (MkPoint c d) = On

pointLineImpl : Point -> Line -> RelationType
pointLineImpl (MkPoint b a) (MkLine c d) = Intersect

class Shape z where

instance Shape Line where

instance Shape Segment where

instance Shape Point where

class (Shape a, Shape b) => Relate a b where
  relate : a -> b -> RelationType
  
instance Relate Point Point where
  relate = pointPointImpl
  
instance Relate Point Line where
  relate = pointLineImpl

