module ImplicitType

data Line = Li

data Point = Po

data Segment = Se

class Shape z where

instance Shape Line where

instance Shape Segment where

instance Shape Point where

rel : Shape a => a -> a
rel x = x

relate : Shape a => {t : Type} -> (a : t) -> String
relate {t = Point}   _ = "pt"
relate {t = Segment} _ = "seg"
relate {t = Line}    _ = "line"

fun : Shape a => {a : Type} -> (b : a) -> a
fun x = _
