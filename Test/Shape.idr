module Test.Shape

import Shape

namespace prerequisites
  bp : Point
  bp = MkPoint 0 0
  
  p1 : Point 
  p1 = MkPoint 1 1
  
  p2 : Point
  p2 = MkPoint 0 1
  
  p3 : Point
  p3 = MkPoint 1 2

res1 : Double
res1 = (Vector 1 8) `det` (Vector 8 2.2)

res2 : Double
res2 = (Segment (MkPoint 1 1.1) (MkPoint 2 2.2)) `det` (Segment (MkPoint 1 1.1) (MkPoint 1.1 2.2))

res3 : line.Relation
res3 = (MkLine bp p1) `relate` (MkLine p2 p3)

main : IO ()
main = do putStr $ show $ res1 == -61.8
          putStr $ show $ res2 == 0.99
          putStrLn $ show $ res3 == Parallel
