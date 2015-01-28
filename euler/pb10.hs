-- Summation of primes : https://projecteuler.net/problem=10
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    case args of
        [] -> print "Need an int as parameter"
        (a:_) -> let response = sum $ eratosthene (read a :: Int)
                 in print response


eratosthene' :: [Int] -> [Int] -> [Int]
eratosthene' primes [] = primes
eratosthene' primes (x:xs) = eratosthene' (primes++[x])  [a | a <- xs, rem a x /= 0]

eratosthene :: Int -> [Int]
eratosthene n = eratosthene' [] [2..n]