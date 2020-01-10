module Lib
    ( displayGrid
    , findWordInLine
    , findWord
    , shiftGrid
    , findWords
    ) where

import Data.List (isInfixOf, transpose)
import Data.Maybe (catMaybes)

type Grid = [String]

-- Simply display the grid
displayGrid :: Grid -> IO ()
displayGrid grid = putStrLn (unlines grid)

-- Identify a word within a line
findWordInLine :: String -> String -> Bool
findWordInLine = isInfixOf

-- Tells if a word is in the grid by looking each
-- lines that compose the grid.
findWord :: Grid -> String -> Maybe String
findWord grid word =
  let found = or $ map (findWordInLine word) grid
  in if found then Just word else Nothing

-- Shift the second line by one on the right, the third by
-- 2 and so on
shiftGrid :: Grid -> Grid
shiftGrid [] = []
shiftGrid (l:ls) = l : (shiftGrid $ map (addUnderscore) ls)
  where addUnderscore word = '_' : word

-- Gives the list of words that are in the grid according
-- to the one passed as parameter
findWords :: Grid -> [String] -> [String]
findWords grid words =
  let forward  = grid
      backward = map reverse grid
      topDown  = transpose grid
      bottomUp = transpose (reverse grid)
      diag1    = transpose (shiftGrid grid)
      diag2    = transpose (shiftGrid backward)
      lines = forward ++ backward ++ topDown ++ bottomUp ++ diag1 ++ diag2
  in catMaybes $ map (findWord lines) words
