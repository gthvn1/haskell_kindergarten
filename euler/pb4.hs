-- Largest palindrome product : https://projecteuler.net/problem=4

main :: IO ()
main = print largestPalindrome

isPalindrome :: Int -> Bool
isPalindrome a = c == reverse c where c = show a

largestPalindromeFor :: Int -> Int
largestPalindromeFor n = let listOfPalindrome = filter isPalindrome $ map (n*) [100..999]
                         in if null listOfPalindrome then 0 else last listOfPalindrome

largestPalindrome :: Int
largestPalindrome = maximum [largestPalindromeFor x | x <- [100..999]]
