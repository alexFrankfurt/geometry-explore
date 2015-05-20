module Enhancement.Relation

import Data

data RelationType = On
                  | Intersect
                  | NotIntersect
                  | TheSame
                  | Parallel

data Relation = RelOf String RelationType String

class Shape a where

instance Shape Line where

instance Shape Segment where

instance Shape Point where

----------------------------------
class Some a where
-- If there is no instance, program type checks (it makes sense:
--     some instance may have such constructor), but
-- function call return :
--   Can't resolve type class Some Segment
instance Some Segment where

fun : Shape a => a -> Nat
fun (MkSegment a b) = 10
----------------------------------

||| type class for types to show it's type
class ShowTy a where
  showTy : a -> String

instance ShowTy Point where
  showTy _ = "Point"
  
instance ShowTy Line where
  showTy _ = "Line"

-- pointPointImpl : (Shape a, Shape b) => a -> b -> Double
-- pointPointImpl a b = point.x a


-- on         relate basePoint point11
-- returns    RelOf "Point" NotIntersect "Line" : Relation
{-
pointPointImpl : (Shape a, Shape b) => Point -> Point -> (a, b)
pointPointImpl a b = (a, b)

pointLineImpl : (Shape a, Shape b) => Point -> Line -> (a, b)
pointLineImpl a b = (a, b)

relate : (Shape a, Shape b) => a -> b -> (a, b)
relate (MkPoint b a) (MkPoint c d) = pointPointImpl (MkPoint a b) (MkPoint c d)
relate (MkPoint b a) (MkLine c d) = pointLineImpl (MkPoint a b) (MkLine c d)
 
res0 : Relation
res0 = relate basePoint point11
-}

-- ||| Represents relation betwen types (here figures)
-- ||| The idea is to wrap three entities:
-- |||  (1) type of figure that relates,
-- |||  (2) relation type shows the relation between (1) and (3) currently not commutative
-- |||  (3) type of figure which relatees
-- ||| In one data structure.
-- data Relation : a -> RelationType -> b -> Type where
--   RelOf : a -> (b : RelationType) -> c -> Relation a b c

-- ||| actually marker class for any figure
-- class Shape a where

-- -- val : Bool
-- -- val = Segment == Segment

-- record Rel where
--   constructor RelOf'
--   f1 : Shape a
--   r : RelationType
--   f2 : Shape a

-- instance Shape Line where

-- instance Shape Segment where


-- {-
-- val : Rel
-- val = RelOf' (Shape seg) r (Shape line)
--             where
--             seg : Segment
--             seg = MkSegment (MkPoint 1 2) (MkPoint 8 3)
--             r : RelationType
--             r = Intersect
--             line : Line
--             line = MkLine (MkPoint 83 3) (MkPoint 11 11)
-- -}
