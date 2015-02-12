
-- Some exos of the chapter4
myFoldl :: (a ->b -> a) -> a -> [b] -> a
myFoldl f z xs  = foldr step id xs z
    where  step x g a  =  g (f a x)

-- write asInt with fold

asIntFold :: String -> Integer
asIntFold ('-':xs) = negate $ asIntFold xs
asIntFold s = foldl operator 0 s
    where 
        operator x y = if y == '.'
                        then error "not a digit '.'"
                        else x * 10 + (read [y] :: Integer)

concatFold :: [[a]] -> [a]
concatFold = foldl (++) []

-- as-pattern
suffixes :: [a] -> [[a]]
suffixes xs@(_:xs') = xs : suffixes xs'
suffixes _ = []
-- Explication:
-- xs will be bind to all value on the right of @
-- At the first iteration, if the input is "abcd":
-- xs is binded to "abcd" and xs' = "bcd"
--
-- Note that is for the exerice because the good way (I think) to do it is:
suffixes' = init . tails
