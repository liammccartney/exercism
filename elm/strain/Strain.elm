module Strain exposing (discard, keep)

import List


keep : (a -> Bool) -> List a -> List a
keep predicate list =
    case list of
        [] ->
            []

        hd :: tl ->
            if predicate hd then
                hd :: keep predicate tl

            else
                keep predicate tl


discard : (a -> Bool) -> List a -> List a
discard predicate list =
    case list of
        [] ->
            []

        hd :: tl ->
            if predicate hd then
                discard predicate tl

            else
                hd :: discard predicate tl
