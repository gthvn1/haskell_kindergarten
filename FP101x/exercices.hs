-- Chap1

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

-- Chap3

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
