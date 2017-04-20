module Data

%access export

public export
record Point where
  constructor MkPoint
  x : Double
  y : Double

Eq Point where
  (==) (MkPoint x1 y1) (MkPoint x2 y2) = x1 == x2 && y1 == y2

[xord] Ord Point where
  compare (MkPoint x1 y1) (MkPoint x2 y2) = compare x1 x2

[yord] Ord Point where
  compare (MkPoint x1 y1) (MkPoint x2 y2) = compare y1 y2

public export
data Line = MkLine Point Point

public export
interface VectLike a where
  x : a -> Double
  y : a -> Double

public export
data Segment = MkSegment Point Point

public export
VectLike Segment where
  x (MkSegment p1 p2) = Point.x p2 - Point.x p1
  y (MkSegment p1 p2) = Point.y p2 - Point.y p1

{-
  Unnecessary
-}

record Triangle where
  constructor MkTriangle
  p1 : Point
  p2 : Point
  p3 : Point
