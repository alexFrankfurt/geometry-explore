module Enhancement.Relation

import Data



data RelationType = On
                  | Intersect
                  | NotIntersect
                  | TheSame
                  | Parallel
                  
pointPointImpl : Point -> Point -> RelationType
pointPointImpl (MkPoint a b) (MkPoint c d) = On

pointLineImpl : Point -> Line -> RelationType
pointLineImpl (MkPoint b a) (MkLine c d) = Intersect                  

-- add constraints for more safe code
class Shape z where

instance Shape Line where

instance Shape Segment where

instance Shape Point where
-------------------------------------

class (Shape a, Shape b) => Relate a b where
  relate : a -> b -> RelationType
  
instance Relate Point Point where
  relate = pointPointImpl
  
instance Relate Point Line where
  relate = pointLineImpl

-- doesn't compiles 
-- data Test : Type where

-- testf : Test -> Test -> RelationType
-- testf a b = Intersect

-- instance Relate Test Test  where
--   relate = testf
  

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

-- type class for types to show it's type
-- class ShowTy a where
--   showTy : a -> String

-- instance ShowTy Point where
--   showTy _ = "Point"
  
-- instance ShowTy Line where
--   showTy _ = "Line"

-- pointPointImpl : (Shape a, Shape b) => a -> b -> Double
-- pointPointImpl a b = point.x a


-- on         relate basePoint point11
-- returns    RelOf "Point" NotIntersect "Line" : Relation



-- When elaborating left hand side of relate:
--      Can't unify
--              Data.Point (Inferred value)
--      with
--              Point (Given value)

-- relate : (Shape a, Shape b) => a -> b -> RelationType
-- relate {a=Point} {b=Point} (MkPoint c d) (MkPoint e f) = pointPointImpl (MkPoint c d) (MkPoint e f)
-- relate (MkPoint b a) (MkLine c d) = pointLineImpl (MkPoint a b) (MkLine c d)
 
-- res0 : RelationType
-- res0 = relate basePoint point11

-- res1 : RelationType
-- res1 = relate point14 line'8'8'2'2

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
