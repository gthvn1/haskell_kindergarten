module Grains (square, total) where

import Criterion.Main

square :: Integer -> Integer
square x = 2 ^ (x - 1)

squareRec :: Integer -> Integer
squareRec 1 = 1
squareRec x = 2 * squareRec (x - 1)

squareTailRec :: Integer -> Integer -> Integer
squareTailRec acc 1 = acc
squareTailRec acc x = squareTailRec (acc * 2) (x - 1)

squareTail :: Integer -> Integer
squareTail = squareTailRec 1

total :: a -> Integer
total _ = sum $ map square [1..64]

total1 :: a -> Integer
total1 _ = 2^64 - 1

main = defaultMain [
    bgroup "square" [ bench "square 64" $ whnf square 64
                    , bench "squareRec 64" $ whnf squareRec 64
                    , bench "squareTail 64" $ whnf squareTail 64
                    , bench "total" $ whnf total 0
                    , bench "total1" $ whnf total1 0
                    ]
    ]
