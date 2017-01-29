myLength [] = 0
myLength [x] = 1
myLength (x:xs) = 1 + myLength xs

myReverse [] = []
myReverse (x:[]) = [x]
myReverse (x:xs) = myReverse xs ++ [x]

isPalindrome (x:[]) = True
isPalindrome (x:y:[]) = x == y
isPalindrome (x:xs) = (x == last xs) && isPalindrome (init xs)

data NetstedList a = Elem a | List [NetstedList a]
    deriving (Show)
l1 = List [Elem 1, List [Elem 2, Elem 3]]
