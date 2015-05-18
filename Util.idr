module Util

import Data

iin : (Ord a, Num a) => a -> (a, a) -> Bool
iin a (b, c) = case b - c > 0 of
  True => c <= a && a <= b
  False => b <= a && a <= c

associn : (Num a, Ord a) => (a, a) -> (a, a) -> Bool
associn (a, b) (c, d) = 
  (a `iin` (c, d)) || (b `iin` (c, d)) ||
  (c `iin` (a, b)) || (d `iin` (a, b))

namespace p
  associn : (Point, Point) -> (Point, Point) -> Bool
  associn (p1, p2) (p3, p4) = case point.x p2 - point.x p1 of
    0.0 => (point.y p1, point.y p2) `associn` (point.y p3, point.y p4)
    _   => (point.x p1, point.x p2) `associn` (point.x p3, point.x p4)

det : VectLike a => a -> a -> Double
det a b = vectLike.y b * vectLike.x a - vectLike.x b * vectLike.y a

divideEnds : Segment -> Segment -> Bool 
divideEnds (MkSegment p1 p2) (MkSegment p3 p4) = 
  det (MkSegment p1 p2) (MkSegment p1 p3) *
  det (MkSegment p1 p2) (MkSegment p1 p4) < 0
