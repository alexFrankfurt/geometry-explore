module InitialData

import Data.Vect

import Data
import Animation

p1 : Point
p1 = MkPoint 25 30

p2 : Point
p2 = MkPoint (-10) 22

p3 : Point
p3 = MkPoint 8 14

p4 : Point
p4 = MkPoint (-28) (-80)

p5 : Point
p5 = MkPoint 10 (-40)

p6 : Point
p6 = MkPoint 88 (-1)

p7 : Point
p7 = MkPoint 20 (-4)

p8 : Point
p8 = MkPoint (-28) 30

d1 : Direction
d1 = MkDirection 0.0180 0.0220

d2 : Direction
d2 = MkDirection 0.0380 (-0.0110)

d3 : Direction
d3 = MkDirection (-0.0130) (-0.0220)

d4 : Direction
d4 = MkDirection 0.0155 0.0270

d5 : Direction
d5 = MkDirection (-0.0290) (-0.0088)

d6 : Direction
d6 = MkDirection 0.0120 (-0.0122)

d7 : Direction
d7 = MkDirection (-0.0180) (-0.0099)

d8 : Direction
d8 = MkDirection (-0.022) 0.088

iniState : State 8
iniState = MkState [p1, p2, p3, p4, p5, p6, p7, p8] (p1, p2)

iniDirections : Vect 8 Direction
iniDirections = [d1, d2, d3, d4, d5, d6, d7, d8]


