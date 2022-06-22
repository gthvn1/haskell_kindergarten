module Collatz where

-- perform one step of Collatz sequence
step :: Integer -> Integer
step x = if even x then down else up
  where down = x  `div` 2
        up = 3 * x + 1

-- compute how many steps is required to reach 1
collatz :: Integer -> Integer
collatz 1 = 0
collatz x = 1 + collatz (step x)

-- find the number beetween 0 and an upperBound
-- that gives the longest sequence. 
longest :: Integer -> Integer
longest upperBound = longest' 0 0 upperBound

-- helper that keep track of the longest sequence
longest' :: Integer -> Integer -> Integer -> Integer
longest' number _ 0 = number
longest' number maxlength n =
  if length > maxlength
  then longest' n length (n - 1)
  else longest' number maxlength (n - 1)
  where length = collatz n 
