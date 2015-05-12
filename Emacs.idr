module Main

record Person where
  constructor MkPerson
  name : String
  age : Nat
  
data Polygon : Nat -> Nat -> Type where
  ConvexPolygon : (a : Nat) -> (a : Nat) -> Polygon a a
  ConcavePolygon : (a : Nat) -> (a : Nat) -> Polygon a a

