import Data.List

isOdd :: Int -> Bool
isOdd n
	| n `mod` 2 == 0 = False
	| otherwise = True

isEven n = n `mod` 2 == 0 