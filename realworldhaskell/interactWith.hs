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
        function = id
