import System.Environment (getArgs)
import DartShots(findFinish)

run = show . findFinish . read

main = fmap (run . head) getArgs >>= putStrLn
