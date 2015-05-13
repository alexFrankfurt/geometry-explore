module Very.Ex


data Vect : Nat -> Type -> Type where
     Nil  : Vect Z a
     (::) : a -> Vect k a -> Vect (S k) a
     
%name Vect xs, ys, zs

zipWith : (a -> b -> c) -> Vect n a -> Vect n b -> Vect n c
zipWith f xs ys = ?zipWith_rhs


tryZipWith : (a -> b -> c) -> Vect n a -> Vect m b -> Maybe (Vect m c)

