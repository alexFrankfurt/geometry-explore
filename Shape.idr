module Shape

data Point = MkPoint Double Double

namespace VectLike
  data Relation = Parallel | Intersect | NotIntersect

x : Point -> Double
x (MkPoint x y) = x

y : Point -> Double
y (MkPoint x y) = y

data Line = MkLine Point Point
data VectLike = Vector Double Double | Segment Point Point


det : VectLike -> VectLike -> Double
det (Vector x y) (Vector z d) = d * x - z * y
det (Segment p1 p2) (Segment p3 p4) = det (Vector (x p2 - x p1)
                                                 $ y p2 - y p1)
                                          (Vector (x p4 - x p3)
                                                 $ y p4 - y p3)

 
%name Point p1, p2, p3, p4
%name VectLike v1, v2, v3

namespace line
  data Relation = Parallel | Intersect | TheSame
  
  instance Eq line.Relation where
    Intersect == Intersect = True
    Parallel == Parallel = True
    TheSame == TheSame = True
    _ == _ = False
  
  relate : Line -> Line -> line.Relation
  relate (MkLine p1 p2) (MkLine p3 p4) with ((Segment p1 p2) `det` (Segment p3 p4))
    | 0.0 = case seg1 `det` (Segment p1 p4) of 0.0 => TheSame
                                               _ => Parallel
              where
      seg1 : VectLike
      seg1 = Segment p1 p2
    | _ = Intersect
    

relate : VectLike -> VectLike -> VectLike.Relation
relate v1 v2 = ?relate_rhs


aimedAt : VectLike -> VectLike -> Bool
aimedAt v1 v2 = case v1 `relate` v2 of Parallel => ?par_rhs
                                       _        => ?notpar_rhs

