-- Largest prime factor : https://projecteuler.net/problem=3
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    case args of
        [] -> print "Need an int as parameter"
        (a:_) -> let response = largestPrime $ read a :: Int
                 in print response

listToTry :: Int -> [Int]
listToTry n = [2..limit] where limit = ceiling . sqrt $ fromIntegral n

-- basic implementation for finding all primes.
findPrimes :: [Int] -> Int -> Int -> [Int]
findPrimes xs index n
    | index >= length xs  || value > n = if n == 1 then [] else [n]
    | rem n value == 0 = value : findPrimes xs index (div n value)
    | otherwise = findPrimes xs (index + 1) n
    where value = xs !! index

largestPrime :: Int -> Int
largestPrime n = last $ findPrimes (listToTry n) 0 n
