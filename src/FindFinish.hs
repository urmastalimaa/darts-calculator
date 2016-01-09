import System.Environment (getArgs)
import DartShots(findFinish, showFinish)

run = showFinish . findFinish . read

main = fmap (run . head) getArgs >>= putStrLn
