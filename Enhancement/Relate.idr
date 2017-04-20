module Relate

import Data

data RelationType = On
                  | Intersect
                  | NotIntersect
                  | TheSame
                  | Parallel

pointPointImpl : Point -> Point -> RelationType
pointPointImpl (MkPoint a b) (MkPoint c d) = On

pointLineImpl : Point -> Line -> RelationType
pointLineImpl (MkPoint b a) (MkLine c d) = Intersect

interface Shape z where

Shape Line where

Shape Segment where

Shape Point where

interface (Shape a, Shape b) => Relate a b where
  relate : a -> b -> RelationType

Relate Point Point where
  relate = pointPointImpl

Relate Point Line where
  relate = pointLineImpl
