module Shape

import Data
import Util

namespace VectLike
  data Relation = Parallel | Intersect | NotIntersect

namespace line
  data Relation = Parallel | Intersect | TheSame
  
  instance Eq line.Relation where
    Intersect == Intersect = True
    Parallel  == Parallel  = True
    TheSame   == TheSame   = True
    _         == _         = False
  
  relate : Line -> Line -> line.Relation
  relate (MkLine p1 p2) (MkLine p3 p4) with ((MkSegment p1 p2) `det` (MkSegment p3 p4))
    | 0.0 = case seg1 `det` (MkSegment p1 p4) of 0.0 => TheSame
                                                 _   => Parallel
              where
      seg1 : Segment
      seg1 = MkSegment p1 p2
    | _ = Intersect
    

relate : Segment -> Segment -> VectLike.Relation
relate (MkSegment p1 p2) (MkSegment p3 p4) = case ((MkLine p1 p2) `relate` (MkLine p3 p4)) of
  Parallel => NotIntersect
  TheSame => if ((p1, p2) `p.associn` (p3, p4)) == True
    then Intersect else NotIntersect
  _ => if not ((MkSegment p1 p2) `divideEnds` (MkSegment p3 p4)) then NotIntersect
       else if not ((MkSegment p3 p4) `divideEnds` (MkSegment p1 p2)) then NotIntersect
       else Intersect
  

aimedAt : Segment -> Segment -> Bool
aimedAt v1 v2 = case v1 `relate` v2 of Parallel => ?par_rhs
                                       _        => ?notpar_rhs

