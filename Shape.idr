module Shape

import Data
import Relation

aimedAt : Segment -> Segment -> Bool
aimedAt v1 v2 = case v1 `relate` v2 of Parallel => ?par_rhs
                                       _        => ?notpar_rhs
