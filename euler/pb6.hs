-- Sum square difference -- https://projecteuler.net/problem=6


sumSquares :: Integer -> Integer
sumSquares n = sum $ map (^2) [1..n]

squareSum :: Integer -> Integer
squareSum n = (^2) . sum $ [1..n]

diffSum :: Integer -> Integer
diffSum n = (squareSum n) - (sumSquares n)
