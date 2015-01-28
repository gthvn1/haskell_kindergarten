import Control.Monad (filterM, liftM)
import Data.Maybe (listToMaybe)
import Debug.Trace (trace)
import System.Directory (doesFileExist, renameFile, removeFile)
import System.Environment (getArgs)
import System.Exit (ExitCode(..))
import System.FilePath (hasExtension, replaceBaseName, takeBaseName)
import System.IO (hPutStrLn, stderr)
import System.Process (createProcess, shell, waitForProcess)

main :: IO ()
main = getArgs >>=  mapM_ redo

trace' arg = trace (show arg) arg

redo :: String -> IO ()
redo target = maybe printMissing doRedo =<< redoPath target
   where doRedo :: FilePath -> IO ()
         doRedo path = do
             (_, _, _, ph) <- createProcess $ shell $ cmd path
             exit <- waitForProcess ph
             case trace' exit of
                 ExitSuccess -> do renameFile tmp target
                 ExitFailure err ->  do hPutStrLn stderr $ "Redo script exited with " ++ show err
                                        removeFile tmp
         tmp = target ++ "--redoing"
         cmd path = trace' $ unwords  ["sh", path, "0", takeBaseName target, tmp]
         printMissing = error $ "No .do file found for target " ++ "'" ++ target ++ "'"

redoPath :: FilePath -> IO (Maybe FilePath)
redoPath target = liftM listToMaybe $ filterM doesFileExist candidates
    where candidates = map (++ ".do") $ target : fallback
          fallback
            | hasExtension target = [replaceBaseName target "default"]
            | otherwise = []
