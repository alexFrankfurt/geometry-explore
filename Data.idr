module Data

data Point = MkPoint Double Double

x : Point -> Double
x (MkPoint x y) = x

y : Point -> Double
y (MkPoint x y) = y

data Line = MkLine Point Point
data VectLike = Vector Double Double | Segment Point Point

%name Point p1, p2, p3, p4
%name VectLike v1, v2, v3
