describeList :: [a] -> String
describeList xs = "This list is " ++ what xs
    where what [] = "an empty list"
          what [p] = "a singleton"
          what _ = "a longer list." 


initials :: String -> String -> String
initials (f:_) (l:_) = f:l:[]

-- Guards
--
max' :: (Ord a) => a -> a -> a
max' a b
    | a < b = b
    | otherwise = a

-- some pattern matching
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

tell :: (Show a) => [a] -> String
tell [] = "Hey... the list is empty"
tell (x:[]) = "They're is only one element: " ++ show(x)
tell (x:y:[]) = "I see two elements that are " ++ show(x) ++ " and " ++ show(y)
tell (x:y:xs) = "This is a long list that starts with " ++ show(x)
 
addVectors :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x-1)

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x] 

-- Other Guards
replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | n <= 0  = []
    | otherwise = x:replicate' (n-1) x

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0  = []
take' _ []    = []
take' n (h:t) = h:take' (n-1) t

--
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    sideArea + 2 * topArea
    where sideArea = 2 * pi * r * h
          topArea  = pi * r * r
