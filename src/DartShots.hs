module DartShots(
  findFinish,
  showFinish
) where

import Darts(Dart(..), dartValue)
import Data.List (sortBy, nubBy, find)
import Data.Function (on)

singleBull = Dart 1 25
doubleBull = Dart 1 50

outerCircleValues = [1..20]
outerCircleModifiers = [1..3]

cartesian xs ys = [(x, y) | x <- xs, y <- ys]

nonBullShots = sortShots . map (uncurry Dart) $ cartesian outerCircleModifiers outerCircleValues

sortShots = sortBy (flip compare `on` dartValue)

possibleShots:: [Dart]
possibleShots = nubEqualShots nonBullShots ++ [singleBull, doubleBull]

nubEqualShots:: [Dart] -> [Dart]
nubEqualShots = nubBy ((==) `on` dartValue)

nubEqualSeries:: [[Dart]] -> [[Dart]]
nubEqualSeries = nubBy ((==) `on` dartFinishCount)

-- any double can be a finishing shot
validFinishers:: [Dart]
validFinishers = (sortShots . map (Dart 2) $ outerCircleValues) ++ [doubleBull]

-- except that a 2-dart finish can't end with double bull
isValidFinish:: [Dart] -> Bool
isValidFinish darts = length darts /= 2 || notElem doubleBull darts

-- infinitely expand a list of dart finishes by trying every possible shot and pruning equal finishes
expandDartSeries:: [[Dart]] -> [[Dart]]
expandDartSeries series = newSeries ++ expandDartSeries newSeries
  where newSeries = nubEqualSeries . concatMap addPossibleShot $ series
        addPossibleShot shots = map (: shots) possibleShots

-- a dart finish contains of at most 3 dart shots
allDartFinishes:: [[Dart]]
allDartFinishes = takeWhile ((<= 3) . length) .
                  filter isValidFinish $
                  expandDartSeries (map (: []) validFinishers)

dartFinishCount:: [Dart] -> Int
dartFinishCount = sum . map dartValue

findFinish :: Int ->  Maybe [Dart]
findFinish count = find ((count ==) . dartFinishCount) allDartFinishes

showFinish :: Maybe [Dart] -> String
showFinish (Just finish) = show finish
showFinish _             = "No checkout"
