module Geometry.Plain.Structure

Key : Type
record Key where
    MkKey : (x : Float) -> 
            (y : Float) -> 
            Key


data Num a => SPoint a a where
  SPoint x y = SPoint x y

Point : Type
Point = Float -> Float -> Type

data Shape = Line Point Point
