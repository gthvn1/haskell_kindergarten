-- Even Fibonacci numbers : https://projecteuler.net/problem=2
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    case args of
        [] -> print "Need an int as parameter"
        (a:_) -> let response = sumEvenFiboList $ read a :: Integer
                 in print response

evenFiboList' :: Integer -> Integer ->  Integer -> [Integer]
evenFiboList' _ _ 0 = []
evenFiboList' _ _ 1 = []
evenFiboList' a b x 
    | even val =  val : evenFiboList' b val (x-1)
    | otherwise =  evenFiboList' b val (x-1)
    where val = a + b

evenFiboList :: Integer -> [Integer]
evenFiboList = evenFiboList' 1 1

-- I don't like the evenFiboList n. I would prefer to generate an infinite
-- number of event from fibo list.
sumEvenFiboList :: Integer -> Integer
sumEvenFiboList n = sum $ takeWhile (< n) $  evenFiboList n
