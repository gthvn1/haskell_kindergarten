head' ::[a] ->a
head' [] = error "Empty list"
head' (x:xs) = x

last' ::[a] ->a
last' = foldr1 (\x acc ->acc)

filter' ::(a ->Bool) ->[a] ->[a]
filter' f = foldr (\x acc ->if f x then x:acc else acc) []


maximum' ::(Ord a) =>[a] ->a
maximum' = foldl1 (\acc x ->if x > acc then x else acc)

reverse' ::[a] ->[a]
reverse' = foldl (\acc x ->x : acc) []