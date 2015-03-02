type Church a = (a -> a) -> a -> a

zero :: Church a
zero  = \f z -> z

one :: Church a
one   = \f z -> f z

two :: Church a
two   = \f z -> (f.f) z

three :: Church a
three = \f z -> (f.f.f) z

-- Example for church to int
-- zero (+1) 0 => 0
-- one (+1) 0  => 1
-- two (+1) 0  => 2

-- Example for church to stars
-- zero ('*':) 0 => ""
-- one ('*':) 0  => "*"
-- two ('*':) 0  => "**"

church :: Integer -> (a -> a) -> a -> a
church 0 f x = x
church n f x = f (church (n-1) f x)

c2i x = church x (+1) 0

-- Example for church to stars
-- 1 -> "*"
-- 5 -> "*****"
c2s x = church x ('*':) []
