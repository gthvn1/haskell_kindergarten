module Lib
    ( grid
    , flowerNames
    , formatGrid
    , outputGrid
    ) where

outputGrid :: [String] -> IO ()
outputGrid grid = putStrLn (formatGrid grid)

formatGrid :: [String] -> String
formatGrid = unlines

grid = [ "__D________R___"
       , "__ANEMONE___O__"
       , "__H__________S_"
       , "__L________T__E"
       , "__IRIS____O____"
       , "__A_U____U__I__"
       , "____G___R___I__"
       , "_______N____M__"
       , "______E_____S__"
       , "_____SALIL__A__"
       , "____O_______J__"
       , "___L___________"
       ]

flowerNames = [ "ANEMONE"
              , "DAHLIA"
              , "GUI"
              , "IRIS"
              , "JASMIN"
              , "LAVANDE"
              , "LILAS"
              , "PAVOT"
              , "PIVOINE"
              , "RENONCULE"
              , "ROSE"
              , "TOURNESOL"
              ]
