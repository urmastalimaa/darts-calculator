module Darts(
 Dart(Dart),
 dartValue,
) where

data Dart = Dart Int Int
            deriving Eq

instance Show Dart
  where show (Dart 3 value) = 'T':show value
        show (Dart 2 value) = 'D':show value
        show (Dart 1 value) = show value
        show _              = "Invalid Dart shot"

dartValue:: Dart -> Int
dartValue (Dart mult value) = mult * value
