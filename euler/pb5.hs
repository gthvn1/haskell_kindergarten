main :: IO ()
main = print smallestNumber

-- again this solution is a little bit a brute force one.
-- TODO: To be improved 
allDivides :: Integer -> Bool
allDivides n = and [ rem n x == 0 | x <- [2..20]]

smallestNumber' :: Integer -> Integer
smallestNumber' n
    | n > 2432902008176640000 || allDivides n = n
    | otherwise = smallestNumber' (n + 1)

smallestNumber :: Integer
smallestNumber = smallestNumber' 20
