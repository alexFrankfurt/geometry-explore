module Geometry.Plain.Structure

import Data.Vect

record Person where
    constructor MkPerson
    name : String
    age : Int

fred : Person
fred = MkPerson "Fred" 30

record Point where
  constructor APoint 
  x : Double
  y : Double

data Polygon

record ConvexPolygon where
  constructor AConvexPolygon
  vertices : Vect n a

cp : ConvexPolygon
cp = AConvexPolygon (Vect 2 (List [1,2]))
