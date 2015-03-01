-- ------------------------------------------------------------------
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

-- ------------------------------------------------------------------
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
-- with conditianals
and' a b = if a == True then if b == True then True else False
                        else False

-- Do the same for
-- True && b = b
-- False && _ = False
and'' a b = if a == True then b
                         else False

-- ------------------------------------------------------------------
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
