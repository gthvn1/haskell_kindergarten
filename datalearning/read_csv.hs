import System.Directory (doesFileExist)
import System.Environment (getArgs)
import Text.CSV (parseCSV)

-- CSV sample get from Salesforce sample resources
-- https://developer.salesforce.com/page/File:RecruitingApp-9_0.zip

main = do
    args <- getArgs
    let filename = case args of
                (a:_) -> a
                _ -> error "Error: You need to provide a file as input"
    exist <- doesFileExist filename
    input <- if exist then readFile filename
                      else putStrLn "File does not exist" >> return ""
    let csv = parseCSV filename input
    either handleError doSomething csv
        where handleError e = putStrLn "error parsing"
              doSomething csv = print "success"
