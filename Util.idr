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
  associn (p1, p2) (p3, p4) = case x p2 - x p1 of
    0.0 => (y p1, y p2) `associn` (y p3, y p4)
    _   => (x p1, x p2) `associn` (x p3, x p4)

det : VectLike -> VectLike -> Double
det (Vector x y) (Vector z d) = d * x - z * y
det (Segment p1 p2) (Segment p3 p4) = det (Vector (x p2 - x p1)
                                                 $ y p2 - y p1)
                                          (Vector (x p4 - x p3)
                                                 $ y p4 - y p3)

divideEnds : VectLike -> VectLike -> Bool
divideEnds (Segment p1 p2) (Segment p3 p4) = 
  det (Segment p1 p2) (Segment p1 p3) *
  det (Segment p1 p2) (Segment p1 p4) < 0
