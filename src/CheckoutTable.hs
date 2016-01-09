import DartShots(findFinish, showFinish)

tableCounts = [40..180]
checkoutTable = map finishWithCount tableCounts
  where finishWithCount count = show count ++ ": " ++ (showFinish . findFinish $ count)

main = putStr . unlines $ checkoutTable
