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
