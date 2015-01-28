-- 10001st prime : https://projecteuler.net/problem=7
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    case args of
        [] -> print "Need an int as parameter"
        (a:_) -> let response = nthPrime (read a :: Int)
                 in print response


primesGenerator' :: [Integer] -> Integer -> [Integer]
primesGenerator' primes x
    | divisible = [] ++ primesGenerator' primes (x + 1)
    | otherwise = x : primesGenerator' (x : primes) (x + 1)
    where divisible = any (\n -> rem x n == 0) primes

primesGenerator :: [Integer]
primesGenerator = 2 : primesGenerator' [2] 3

nthPrime :: Int -> Integer
nthPrime x = last $ take x primesGenerator
