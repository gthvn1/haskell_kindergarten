church :: Integer -> (a -> a) -> a -> a
church 0 f x = x
church n f x = f (church (n-1) f x)

-- Example for church to int
c2i x = church x (+1) 0

-- Example for church to stars
-- 1 -> "*"
-- 5 -> "*****"
c2s x = church x ('*':) []
