module Data

namespace point
  data Point = MkPoint Double Double

  x : Point -> Double
  x (MkPoint x y) = x

  y : Point -> Double
  y (MkPoint x y) = y

data Line = MkLine Point Point

namespace vectLike
  class VectLike a where
    x : a -> Double
    y : a -> Double

data Segment = MkSegment Point Point

instance VectLike Segment where
  x (MkSegment p1 p2) = point.x p2 - point.x p1
  y (MkSegment p1 p2) = point.y p2 - point.y p1

record Triangle where
  constructor MkTriangle
  p1 : Point
  p2 : Point
  p3 : Point

data Triangulation = MkTriangulation

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
