import DartShots(findFinish, showFinish)

tableCounts = [40..180]
checkoutTable = map (showFinishWithCount . findFinish) tableCounts

showFinishWithCount (count, finish) = show count ++ ": " ++ showFinish finish

main = putStr . unlines $ checkoutTable
