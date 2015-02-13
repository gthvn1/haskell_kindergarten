module FirstWord where

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
        function = firstWord

-- exo chap4/
-- Using the command framework from the section called
-- “A simple command line framework”, write a program that
-- prints the first word of each line of its input.


firstWord :: String -> String
firstWord input = unlines $ map (saferHead . words) (lines input)
  where -- We need to deal with empty line
    saferHead :: [String] -> String
    saferHead [] = ""
    saferHead (x:_) = x
