import Darts(Dart)
import DartShots(findFinish, dartFinishCount)

tableCounts = [40..180]
checkoutTable = map findFinish tableCounts

showFinish:: [Dart] -> String
showFinish finish = show (dartFinishCount finish) ++ ": " ++ show finish

main = putStr . unlines . map showFinish $ checkoutTable
