doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
                        then x
                        else x*2

head' :: [a] -> a
head' [] = error "Can't call head on an empty list"
head' (x:_) = x

length' :: Num b => [a] -> b
length' [] = 0
length' (x:xs) = 1 + length' xs

