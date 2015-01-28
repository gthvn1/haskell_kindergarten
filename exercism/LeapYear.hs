module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear y
    | isNotDivisibleBy 4   = not leap
    | isNotDivisibleBy 100 = leap
    | isNotDivisibleBy 400 = not leap
    | otherwise = leap
    where
        isNotDivisibleBy x = y `mod` x /= 0 
        leap = True
