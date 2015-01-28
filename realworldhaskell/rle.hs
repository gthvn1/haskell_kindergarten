import Data.List

rleEncoder :: String -> [(Int, Char)]
rleEncoder s = zip (listNbCar s) (groupCar s)
    where listNbCar s = map length $ group s
          groupCar s = map head $ group s

rleDecoder :: [(Int, Char)] -> String
rleDecoder l = concat $ map (\(i,c) -> replicate i c) l
