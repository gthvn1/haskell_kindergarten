-- If we want to hide some definitions from Prelude we can:
-- import Prelude hiding (||)

-- --------------------------------
-- Chap1
--

double x = x + x
quadruple = double . double

factorial n = product [1..n]
average ns = div (sum ns) (length ns)

last' xs = xs !! (length xs - 1)
last'' = head . reverse

init' xs = take (length xs - 1) xs
init'' = reverse . tail . reverse

n = a `div` length xs
    where
        a = 10
        xs = [1..5]

-- --------------------------------
-- Chap3
--
signum' n | n < 0  = -1
          | n == 0 = 0
          | otherwise = 1

odd' n = map (\x ->x*2+1) [1..n]

-- With a conditional expression
safeTail xs = if null xs then [] else tail xs

-- With guarded equations
safeTail' xs | null xs   = []
             | otherwise = tail xs

-- with pattern matching
safeTail'' [] = []
safeTail'' xs = tail xs

-- or' with pattern matching
or' True _  = True
or' False a = a

-- True && True = True
-- _ && _ = False
-- with conditionals
and' a b = if a == True then if b == True then True else False
                        else False

-- Do the same for
-- True && b = b
-- False && _ = False
and'' a b = if a == True then b
                         else False

-- --------------------------------
-- Chap4 - List comprehensions

factors n = [x | x <- [1..n], n `rem` x == 0]
prime n = factors n == [1, n]
primes n = [x | x <- [2..n], prime x]

pairs xs = zip xs (tail xs)
sorted xs = and [x <= y | (x,y) <- pairs xs]

positions x xs = [i | (i, x') <- zip [1..] xs, x == x']

-- Exercises
-- pythagorean
pyths n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

-- a number is perfect if it equals the sum of all of its factors excluding the
-- number itself.
perfects n = [x | x <- [2..n], x == sum (init (factors x))]

scalar xs ys = [x*y | (x,y) <- zip xs ys]

-- --------------------------------
-- Chap5 - Recursion

fact n = fact' 1 n
    where fact' acc n | n <= 1    = acc
                      | otherwise = fact' (acc*n) (n-1)

quicksort [] = []
quicksort (x:xs) =  quicksort smaller ++ [x] ++ quicksort larger
    where
        smaller = [a | a <- xs, a <= x]
        larger = [b | b <- xs, b > x]

-- Exercices

-- and with recurison
-- note: and <list>
and''' [] = True
and''' (x:xs) = if x == False then False
                              else and''' xs

concat' [] ys = ys
concat' (x:xs) ys = x : (concat' xs ys)

replicate' n v | n == 0 = [v]
               | otherwise = v : (replicate' (n-1) v)

nth [] _ = error "We reached empty list"
nth (x:xs) 0 = x
nth (x:xs) n = nth xs (n-1)

elem' a [] = False
elem' a (x:xs) = if x == a then True else elem' a xs

merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = if x < y then x : merge xs (y:ys)
                               else y : merge (x:xs) ys

msort xs ys = merge (mergeOrSort xs) (mergeOrSort ys)
    where
        mergeOrSort l | length l <= 1 = l
                      | otherwise = msort fstHalf sndHalf
            where
                fstHalf = take (length l `div` 2) l
                sndHalf = drop (length l `div` 2) l

-- --------------------------------
-- Chap6 - High Order functions

-- Express [f x| x <- xs, p x] using map and filter
exo6 f p xs = map f (filter p xs)

-- reverse' [1, 2, 3]
-- foldr (\x -> ++ [x]) [] [1, 2, 3]
-- foldr (\x -> ++ [x]) [] (1:(2:(3:[])))
-- ((([] ++ [3]) ++ [2]) ++ [1])
-- [3, 2, 1]
reverse' = foldr (\x -> (++ [x])) []

-- map f [1, 2, 3]
-- foldr (\x -> ???) [] $ f [1, 2, 3]
-- (f 1:(f 2:(f 3:[])))
map' f xs = foldr (\x -> (f x : )) [] xs

-- filter f [1, 2, 3, 4]
filter' p = foldr (\x -> ((if p x then [x] else []) ++)) []


-- --------------------------------
-- Chap7

type Parser a = String -> [(a, String)]

-- A parser that extracts a single caracter.
item :: Parser Char
item = \inp -> case inp of
                    []     -> []
                    (x:xs) -> [(x, xs)]

-- Parser that always fails.
failure :: Parser a
failure = \inp -> []

-- The parser that always succeeds.
return' :: a -> Parser a
return' v = \inp -> [(v, inp)]

(+++) :: Parser a -> Parser a -> Parser a
p +++ q = \inp -> case p inp of
                    []  -> q inp
                    [(v, out)] -> [(v, out)]


parse :: Parser a -> String -> [(a, String)]
parse p inp = p inp

parser1 :: Parser (Char, Char)
parser1 = do { x <- item;
               item;
               y <- item;
               return' (x, y)}
