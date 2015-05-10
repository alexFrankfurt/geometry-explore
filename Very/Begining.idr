module Very.Begining

import Data.Vect
import Geometry.Plain.Structure

add : Nat -> Nat -> Nat
add x y = x + y

lis : Vect 3 Nat
lis = [1,2,3]

takeN : (n : Nat) -> Vect (n + k) a -> Vect n a
takeN Z _             = []
takeN (S l) (x :: xs) = x :: take l xs

--takeTwo : (f : Nat) -> (s : Nat) -> (Vect (f + s + k) a) -> (Vect f a, Vect s a, Vect k a)
--takeTwo 0 0 [] = ([], [], [])
--takeTwo 

applyNTimes : (n : Nat) -> (v : a) -> (f: a -> a) -> a
applyNTimes Z v f     = v
applyNTimes (S k) v f = f (applyNTimes k v f)

num : Nat
num = 8

val : Integer
val = 2

fun : Integer -> Integer
fun = (*2)
