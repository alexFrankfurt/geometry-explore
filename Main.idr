module Main

import Shape
import Effects
import Effect.StdIO

hello : Eff () [STDIO] 
hello = do putStr "Enter your name "
           x <- getStr
           putStrLn ("Hello, " ++ trim x ++ "!")

record Person where
  constructor MkPerson
  name : String

main : IO ()
main = run hello
