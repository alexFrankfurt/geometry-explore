module Enhancement.Relation

import Data

data RelationType = On
                  | Intersect
                  | NotIntersect
                  | TheSame
                  | Parallel

-- ||| Represents relation betwen types (here figures)
-- data Shape a => Relation : a -> RelationType -> b -> Type where
--   RelOf : a -> (b : RelationType) -> c -> Relation a b c

class Shape a where
p
-- val : Bool
-- val = Segment == Segment

record Rel where
  constructor RelOf
  

instance Shape Line where

instance Shape Segment where

-- val : Relation f1 r f2
-- val = RelOf seg r line
--             where
--             seg : Segment
--             seg = MkSegment (MkPoint 1 2) (MkPoint 8 3)
--             r : RelationType
--             r = Intersect
--             line : Line
--             line = MkLine (MkPoint 83 3) (MkPoint 11 11)
