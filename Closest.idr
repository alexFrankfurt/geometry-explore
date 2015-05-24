module Closest

import Data.Vect

import Data

pts : List Point
pts = [basePoint,point11,point14]

sortedPts : List Point
sortedPts = sort @{yord} pts
