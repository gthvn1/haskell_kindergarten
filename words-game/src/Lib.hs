module Lib
    ( flowerGrid
    , flowerNames
    , displayGrid
    , findWordInLine
    , findWord
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

-- Gives the list of words that are in the grid according
-- to the one passed as parameter
findWords :: Grid -> [String] -> [String]
findWords grid words =
  let searchForward = grid
      searchBackward = map reverse grid
      searchTopDown = transpose grid
      searchBottomUp = transpose (reverse grid)
      lines = searchForward ++ searchBackward ++
              searchTopDown ++ searchBottomUp
  in catMaybes $ map (findWord lines) words

-- A grid used for testing
flowerGrid = [ "__D________R___"
             , "__ANEMONE___O__"
             , "__H__________S_"
             , "__L____PAVOT__E"
             , "__IRIS____O____"
             , "__A_U____U__N__"
             , "____G___R___I__"
             , "_______N____M__"
             , "______E_____S__"
             , "_____SALIL__A__"
             , "____O_______J__"
             , "___L___________"
             ]

-- List of flower find in the flowerGrid
flowerNames = [ "ANEMONE"
              , "DAHLIA"
              , "GUI"
              , "IRIS"
              , "JASMIN"
              , "LILAS"
              , "PAVOT"
              , "ROSE"
              , "TOURNESOL"
              ]
