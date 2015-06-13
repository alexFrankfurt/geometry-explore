module Main

import Effects
import Effect.StdIO
import Effect.File
import Action

main : IO ()
main = run openAndBegin
