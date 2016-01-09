import System.Environment (getArgs)
import DartShots(findFinish, showFinish)

run = showFinish . snd . findFinish . read

main = fmap (run . head) getArgs >>= putStrLn
