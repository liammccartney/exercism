module Sublist exposing (ListComparison(..), sublist)

import Array exposing (Array)


type ListComparison
    = Equal
    | Superlist
    | Sublist
    | Unequal


sublist : List a -> List a -> ListComparison
sublist alist blist =
    let
        helper a b returnType =
            if Array.isEmpty b then
                Unequal

            else if a == Array.slice 0 (Array.length a) b then
                returnType

            else
                helper a (Array.slice 1 (Array.length b) b) returnType
    in
    if alist == blist then
        Equal

    else if List.isEmpty alist then
        Sublist

    else if List.isEmpty blist then
        Superlist

    else if List.length alist < List.length blist then
        helper (Array.fromList alist) (Array.fromList blist) Sublist

    else
        helper (Array.fromList blist) (Array.fromList alist) Superlist
