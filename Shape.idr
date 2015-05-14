module Shape

data Point = MkPoint Double Double

x : Point -> Double
x (MkPoint x y) = x

y : Point -> Double
y (MkPoint x y) = y

data VectLike = Vector Double Double | Segment Point Point

det : VectLike -> VectLike -> Double
det (Vector x y) (Vector z d) = d * x - z * y
det (Segment p1 p2) (Segment p3 p4) = det (Vector ((x p2) - (x p1))
                                                  ((y p2) - (y p1)))
                                          (Vector ((x p4) - (x p3))
                                                  ((y p4) - (y p3)))
 
relate : Point -> VectLike -> Bool

test : VectLike -> Double
test (Vector x y) = x
