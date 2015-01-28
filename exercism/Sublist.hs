module Sublist (
    Sublist(Equal, Sublist, Superlist, Unequal),
    sublist
) where

data Sublist = Equal | Sublist | Superlist | Unequal deriving (Eq, Show)

commonList :: (Eq a) => [a] -> [a] -> [a] -> [a]
commonList c [] [] = c
commonList c _ [] = c
commonList c [] _ = c
commonList c (x:xs) (y:ys)
    | x == y  = commonList (c ++ [x]) xs ys
    | length xs < length ys = commonList [] (x:xs) ys
    | otherwise = commonList [] xs (y:ys)

sublist :: (Eq a) => [a] -> [a] -> Sublist
sublist x y
    | c == x && c == y = Equal
    | c == x = Sublist
    | c == y = Superlist
    | otherwise = Unequal
    where c = commonList [] x y
