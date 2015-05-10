module Geometry.Plain.Structure

Point : Num a => a -> (a, a)
Point a = (a, a)

APoint : Num a => a -> a -> (a, a)
APoint x y = (x, y)

xOf : Num a => APoint -> a
xOf APoint x y = x






































{-
Key : Type
record Key where
    MkKey : (x : Float) -> 
            (y : Float) -> 
            Key


data Num a => SPoint a a where
  SPoint x y = SPoint x y

Point : Type
Point = Float -> Float -> Type

data Shape = Line Point Point-}
