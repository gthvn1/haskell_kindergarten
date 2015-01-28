-- Special Pythagorean triplet : https://projecteuler.net/problem=9

main :: IO ()
main = do
	print $ "Triplet is " ++ show triplet
	print $ "Its product is " ++ show (productTriplet triplet)
	where triplet = pythagoreanTriplet

isPythagorean :: Int -> Int -> Int -> Bool
isPythagorean a b c = a*a + b*b == c*c

pythagoreanTriplet :: (Int, Int, Int)
pythagoreanTriplet = head [(a, b, 1000 - a - b) | a <- [1..1000], b <- [a..1000],
                                                  isPythagorean a b (1000 - a - b)]

productTriplet :: (Int, Int, Int) -> Int
productTriplet (a, b, c) = a * b * c