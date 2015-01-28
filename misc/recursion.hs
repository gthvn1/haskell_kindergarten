elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' a (x:xs)
    | a == x = True
    | otherwise = a `elem'` xs


zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y):l
    where l = zip' xs ys

maximum' :: (Ord a) => [a] ->a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxRest = x
    | otherwise = maxRest
    where maxRest = maximum' xs

replicate' :: Int -> a -> [a]
replicate' 0 a = []
replicate' n a = a:l
    where l = replicate' (n-1) a

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x:l
    where l = take' (n-1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' a = a:repeat' a
