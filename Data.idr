module Data

record Point where
  constructor MkPoint
  x : Double
  y : Double

instance Eq Point where
  (==) (MkPoint x1 y1) (MkPoint x2 y2) = x1 == x2 && y1 == y2

instance [xord] Ord Point where
  compare (MkPoint x1 y1) (MkPoint x2 y2) = compare x1 x2
  
instance [yord] Ord Point where
  compare (MkPoint x1 y1) (MkPoint x2 y2) = compare y1 y2  

data Line = MkLine Point Point

namespace vectLike
  class VectLike a where
    x : a -> Double
    y : a -> Double

data Segment = MkSegment Point Point

instance VectLike Segment where
  x (MkSegment p1 p2) = Point.x p2 - Point.x p1
  y (MkSegment p1 p2) = Point.y p2 - Point.y p1

record Triangle where
  constructor MkTriangle
  p1 : Point
  p2 : Point
  p3 : Point

-- Some prerequisites.
basePoint : Point
basePoint = MkPoint 0 0

point11 : Point
point11 = MkPoint 1 1

point14 : Point
point14 = MkPoint 1 4

line'8'8'2'2 : Line
line'8'8'2'2 = MkLine (MkPoint 8 8) (MkPoint 2 2)

triangle1 : Triangle
triangle1 = MkTriangle (basePoint) (point11) (point14)
