module Prerequisites

import Data

%access export

basePoint : Point
basePoint = MkPoint 0 0

point11 : Point
point11 = MkPoint 1 1

point14 : Point
point14 = MkPoint 1 4

line'8'8'2'2 : Line
line'8'8'2'2 = MkLine (MkPoint 8 8) (MkPoint 2 2)

triangle1 : Triangle
triangle1 = MkTriangle basePoint point11 point14
