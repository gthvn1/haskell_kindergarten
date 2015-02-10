-- Exercice: Write your own "safe' definitions of the standard partial list functions.

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:xs) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:xs) = Just xs

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast (x:[]) = Just x
safeLast (x:xs) = safeLast xs

safeInit :: [a] -> Maybe [a]
safeInit l = safeInitTemp l []
  where safeInitTemp [] _ = Nothing
        safeInitTemp (x:[]) ys = Just ys
        safeInitTemp (x:xs) ys = safeInitTemp xs (ys ++ [x])

-- A better solution
safeHelper func [] = Nothing
safeHelper func xs = Just $ func xs

safeHead' = safeHelper head
safeTail' = safeHelper tail
safeLast' = safeHelper last
safeInit' = safeHelper init


-- Write a version of splitWith
-- splitWith (\x -> x == '\n') "hello\nworld"
--   => ["hello", "world"]
splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _ [] = []
splitWith fn l = splitWithAcc fn l []
  where splitWithAcc _ [] acc = [acc]
        splitWithAcc fn (x:xs) acc = if fn x
                                     then [acc] ++ splitWithAcc fn xs []
                                     else splitWithAcc fn xs (acc ++ [x])
