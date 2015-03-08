evens xs = [x | x <- xs, even x]
squares n = [x*x | x <- [1..n]]
squares' m n = [x*x | x <- [n+1..n+m]]
sumSquares n = sum (squares n)
sumSquares' x = sum . uncurry squares' $ (x, x)
coords m n = [(x, y) | x <- [0..m], y <- [0..n]]
