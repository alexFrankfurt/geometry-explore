module Action

import Effects
import Effect.StdIO
import Effect.File
import Animation
import InitialData
import Algo

writeNTS : Nat -> (State n, Vect n Direction) -> { [FILE_IO (OpenFile Write), STDIO] } Eff ()
writeNTS n s = case n of
                    Z => do return ()
                    _ => do let s' = findNewState s
                            --writeLine (strState s')
                            writeLine "fjklds"
                            putStrLn "wrote"
                            writeNTS (n - 1) s
                  
openAndBegin : { [FILE_IO (), STDIO] } Eff ()
openAndBegin = do True <- open "output" Write | False => putStrLn "Error!"
                  putStrLn "File opened!"
                  writeNTS 10 (iniState, iniDirections) 
                  close

main : IO ()
main = run openAndBegin
