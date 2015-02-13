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

-- exo chap4/SplitLines
splitLines :: String -> [String]
splitLines [] = []
splitLines cs =
  let (pre, suff) = break isLineTerminator cs
  in pre : case suff of
                 ('\r' : '\n' : rest) -> splitLines rest
                 ('\r' : rest) -> splitLines rest
                 ('\n' : rest) -> splitLines rest
                 _ -> []

isLineTerminator c = c == '\r' || c == '\n'
