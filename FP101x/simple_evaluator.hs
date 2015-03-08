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

-- ---------------------------------------------------------------------------
-- The Monad world
-- ---------------------------------------------------------------------------

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

-- So we take two maybe and return a tuple of maybe. eval can be redifined
-- as follow:

-- Note:
--   we have: seqn (Just a) (Just b) -> Just (a,b)
--  and we want to do: f (Just (a,b)) = f (a,b) with f = safeDiv
-- So we need a function apply that will take a function, a Maybe a and
-- will return a Maybe b.
--
apply :: (a -> Maybe b) -> Maybe a -> Maybe b
apply _ Nothing = Nothing
apply f (Just x) = f x

eval'' (Val n) = Just n
eval'' (Div x y) = apply f (seqn (eval'' x) (eval'' y))
                    where f (n, m) = safeDiv n m

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

-- The problem here is if we have multiple parameter like eval (Op x y z),
-- that will generates nested tuples.
-- eval (Op x y z) = apply f (seqn (eval x) (seqn (eval y) (eval z)))
--                 where ...

-- To avoid that we can replace apply by putting f at the end:
apply' :: Maybe a -> (a -> Maybe b) -> Maybe b
apply' Nothing _ = Nothing
apply' (Just x) f = f x

-- we recognized the more generic
-- (>>=) :: Monad m => m a -> (a -> m b) -> m b
-- Nothing >>= _ = Nothing
-- (Just x) >>= f = f x

-- So we can rewrite eval as
eval''' (Val n) = Just n
eval''' (Div x y) = (eval''' x) `apply'` (\n ->
                    (eval''' y) `apply'` (\m ->
                    safeDiv n m))

-- Again we see a pattern where the nested tuples are replaced by many
-- apply' but Haskell provide a special do notation here so we can write:
eval'''' (Val n) = Just n
eval'''' (Div x y) = do n <- eval'''' x
                        m <- eval'''' y
                        safeDiv n m

-- This notation is not specific to Maybe but can be generalized for all
-- types that are instance of Monads. To be instance of monads, a type must
-- support: return and >>=
--
-- That means:
--  class Monad m where
--    return :: a -> m a
--    (>>=) :: m a -> (a -> m b) -> m b
--
--  instance Monad Maybe where
--    -- return
--    return x = Just x
--    -- >>=
--    Nothing >>= _ = Nothing
--    (Just x) >> = f = f x

-- Example for Maybe:
--
