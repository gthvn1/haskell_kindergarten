-- A try to understand Monads...
--     http://www.cs.nott.ac.uk/~gmh/monads
--
-- Let takes the simple language based on integer values and the division
-- operator.

data Expr = Val Int | Div Expr Expr

-- eval (Div (Val 10) (Val 2))
-- => 5
-- We can evaluate an expression as follow

eval :: Expr -> Int
eval (Val n) = n
eval (Div x y) = div (eval x) (eval y)

-- The problem here is that
-- eval (Div (Val 10) (Val 0))
-- => *** Exception: divide by zero

-- On solution to deal with that is to use a "safe" version of division
-- using Maybe type:
safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv n m = Just (div n m)

-- So we can modify our evaluation to use the safeDiv. Now we need to check
-- if the new evaluation returns Nothing or Just x

eval' :: Expr -> Maybe Int
eval' (Val n) = Just n
eval' (Div x y) = case eval' x of
                    Nothing -> Nothing
                    Just a  -> case eval' y of
                                Nothing -> Nothing
                                Just b  -> safeDiv a b

-- In eval' we can extract the following pattern
seqn :: Maybe a -> Maybe b -> Maybe (a,b)
seqn Nothing _ = Nothing
seqn _ Nothing = Nothing
seqn (Just x) (Just y) = Just (x,y)

eval'' (Val n) = Just n
eval'' (Div x y) = apply f (seqn (eval'' x) (eval'' y))
                    where f (n, m) = safeDiv n m

apply :: (a -> Maybe b) -> Maybe a -> Maybe b
apply f Nothing = Nothing
apply f (Just x) = f x

-- eval'' (Div (Val 4) (Val 0))
-- <=> eval'' (Div (Just 4) (Just 0))
-- <=> apply f (seqn (eval'' 4) (eval'' 0)))
-- <=> apply f (seqn (Just 4) (Just 0)))
-- <=> apply f (Just (4,0))
-- <=> f (4,0)
-- <=> safeDiv 4 0
-- <=> Nothing
--
-- eval'' (Div (Val 4) (Val 2))
-- <=> ... almost the same as above and we reach:
-- <=> f (4,2)
-- <=> safeDiv 4 2
-- <=> Just 2
