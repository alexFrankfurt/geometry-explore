module Relation

import Util
import Data

||| Enumeration of possible relations between figures
data RelationType = On
                  | Intersect
                  | NotIntersect
                  | TheSame
                  | Parallel

Eq RelationType where
  On           == On           = True
  Intersect    == Intersect    = True
  NotIntersect == NotIntersect = True
  TheSame      == TheSame      = True
  Parallel     == Parallel     = True
  _            == _            = False

namespace ll
  relate : Line -> Line -> RelationType
  relate (MkLine p1 p2) (MkLine p3 p4) with ((MkSegment p1 p2) `det` (MkSegment p3 p4))
    | 0.0 = case seg1 `det` (MkSegment p1 p4) of 0.0 => TheSame
                                                 _   => Parallel
              where
      seg1 : Segment
      seg1 = MkSegment p1 p2
    | _ = Intersect

namespace ss
  relate : Segment -> Segment -> RelationType
  relate (MkSegment p1 p2) (MkSegment p3 p4)
    = case ((MkLine p1 p2) `relate` (MkLine p3 p4)) of
           Parallel => NotIntersect
           TheSame => if ((p1, p2) `p.associn` (p3, p4)) == True
                      then Intersect else NotIntersect
           _ => if not ((MkSegment p1 p2) `divideEnds` (MkSegment p3 p4))
                then NotIntersect
                else if not ((MkSegment p3 p4) `divideEnds` (MkSegment p1 p2))
                then NotIntersect
                else Intersect
