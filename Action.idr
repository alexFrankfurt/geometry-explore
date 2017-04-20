module Action

import Effects
import Effect.StdIO
import Effect.File
import Data.Vect

import Animation
import InitialData
import Algo

writeNTS : Nat -> (State n, Vect n Direction) -> Eff () [FILE (), STDIO]
-- writeNTS n s = case n of
--                     Z => do return ()
--                     _ => do let s' = findNewState s
--                             --writeLine (strState s')
--                             writeLine "fjklds"
--                             putStrLn "wrote"
--                             writeNTS (n - 1) s

public export
openAndBegin : Eff () [FILE (), STDIO]
-- openAndBegin = do (Success) <- open "output" WriteTruncate
--                             |  (FError err) => putStrLn "Error!"
--                   close
--                   putStrLn "File opened!"
--                   writeNTS 10 (initState, iniDirections)
--                   close
