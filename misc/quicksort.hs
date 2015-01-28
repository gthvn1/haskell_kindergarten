quicksort :: (Ord a) => [a] ->[a]
quicksort [] = []
quicksort (x:xs) = 
    smallerThan ++ [x] ++ biggerThan
    where smallerThan = quicksort [y | y <-xs, y <= x]
          biggerThan  = quicksort [y | y <-xs, y > x]


lucky :: Int -> String
lucky 1 = "un un"
lucky 2 = "deux"
lucky x = "autre chose"
