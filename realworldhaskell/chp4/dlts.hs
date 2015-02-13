import Data.List (isInfixOf)
import System.Environment (getArgs)

interactWith :: (String -> String) -> FilePath -> FilePath -> IO ()
interactWith function inputFile outputFile = do
        input <- readFile inputFile
        writeFile outputFile (function input)

main :: IO ()
main = do
    args <- getArgs
    case args of
        [input, output] -> interactWith function input output
        _ -> error "Take exactly two parameters"
    where
        -- replace function by your function
        function = dlts

-- extract macro names that starts with: #define DLT_
dlts :: String -> String
dlts s = unlines $ foldr step [] $ lines s
    where
        step l ds = if "#define DLT_" `isInfixOf` l
                    then secondWord l : ds
                    else ds
        secondWord = head . tail . words
