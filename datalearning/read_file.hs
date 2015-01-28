import System.Directory (doesFileExist)
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    let filename = case args of
                        (a:_) -> a
                        _ -> "input.txt"
    exist <- doesFileExist filename
    -- Here we don't want to break the programme if an error occurred.
    -- We just print the error and return an empty string.
    input <- if exist then readFile filename
                      else print ("Error: " ++ filename ++ " does not exist") >> return ""
    print $ countWords input

countWords :: String -> [Int]
countWords input = map (length.words) (lines input)
