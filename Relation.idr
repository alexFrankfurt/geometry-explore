module Relation

import Data

||| Set of possible relations between figures
data RelationType = On
                  | Intersect
                  | NotIntersect
                  | TheSame
                  | Parallel

||| Represents relation betwen types (here figures)
||| The idea is to wrap three entities:
|||  (1) type of figure that relates,
|||  (2) relation type shows the relation between (1) and (3) currently not commutative
|||  (3) type of figure which relatees
||| In one data structure.
data Relation : a -> RelationType -> b -> Type where
  RelOf : a -> (b : RelationType) -> c -> Relation a b c

||| actually marker class for any figure
class Shape a where

-- val : Bool
-- val = Segment == Segment

record Rel where
  constructor RelOf'
  f1 : Shape a
  r : RelationType
  f2 : Shape a

instance Shape Line where

instance Shape Segment where

||| Fail when try to create instance of Relation type.
val : Rel
val = RelOf' (Shape seg) r (Shape line)
            where
            seg : Segment
            seg = MkSegment (MkPoint 1 2) (MkPoint 8 3)
            r : RelationType
            r = Intersect
            line : Line
            line = MkLine (MkPoint 83 3) (MkPoint 11 11)

