module Test.Shape

import Shape

res1 : Double
res1 = (Vector 1 8) `det` (Vector 8 2.2)

res2 : Double
res2 = (Segment (MkPoint 1 1.1) (MkPoint 2 2.2)) `det` (Segment (MkPoint 1 1.1) (MkPoint 1.1 2.2))

main : IO ()
main = do putStr $ show $ res1 == -61.8
          putStr $ show $ res2 == 0.99
