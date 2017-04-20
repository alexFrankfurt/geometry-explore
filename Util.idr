module Util

import Effects
import Effect.State
import Effect.Random
import Data.Vect

import Data

%access export

iin : (Ord a, Neg a) => a -> (a, a) -> Bool
iin a (b, c) = case b - c > 0 of
  True => c <= a && a <= b
  False => b <= a && a <= c

associn : (Neg a, Ord a) => (a, a) -> (a, a) -> Bool
associn (a, b) (c, d) =
  (a `iin` (c, d)) || (b `iin` (c, d)) ||
  (c `iin` (a, b)) || (d `iin` (a, b))

namespace p
  associn : (Point, Point) -> (Point, Point) -> Bool
  associn (p1, p2) (p3, p4) = case Point.x p2 - Point.x p1 of
    0.0 => (Point.y p1, Point.y p2) `associn` (Point.y p3, Point.y p4)
    _   => (Point.x p1, Point.x p2) `associn` (Point.x p3, Point.x p4)


det : (VectLike a) => a -> a -> Double
det a b = y b * x a - x b * y a

divideEnds : Segment -> Segment -> Bool
divideEnds (MkSegment p1 p2) (MkSegment p3 p4) =
  det (MkSegment p1 p2) (MkSegment p1 p3) *
  det (MkSegment p1 p2) (MkSegment p1 p4) < 0

line : Segment -> Line
line (MkSegment p1 p2) = MkLine p1 p2

-- Make real random, currently it creates the same number.

randInt : Integer -> Integer
randInt x = runPure (do srand 1234459
                        rndInt (-x) x)

randDouble : Integer -> Double
randDouble x = fromInteger (randInt x )

randPt : Integer -> Integer -> Point
randPt x y = MkPoint (randDouble x) (randDouble y)

randPts : (n : Nat) -> Vect n Point
randPts Z     = []
randPts (S k) = (randPt 200 200) :: randPts k
