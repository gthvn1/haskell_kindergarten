-- Multiples of 3 and 5 : https://projecteuler.net/problem=1
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    case args of
        [] -> print "Need an int as parameter"
        (a:_) -> let response = sumOfMultiple $ read a :: Int
                 in print response

multipleOf35 :: Int -> [Int]
multipleOf35 limit = [x | x <- [1..limit-1], x `rem` 3 == 0 || x `rem` 5 == 0]

sumOfMultiple :: Int -> Int
sumOfMultiple = sum . multipleOf35
