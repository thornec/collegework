maximum' :: (Ord a) => [a] -> a
maximum' [] = error "Empty List"
maximum' [x] = x
maximum' (x:xs)
		| x > maxTail = x
		| otherwise = maxTail
		where maxTail = maximum' xs

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' _ [] = []
take' 0 [x] = [x]
take' n (x:xs) = x : take' (n-1) xs  

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> a
repeat' a = repeat' a

zip' :: [a] -> [a] -> [a]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys


elem' :: (Eq a) -> a -> [a] -> Bool
elem' _ [] = False
elem' a (x:xs)
        | a == x = True
        | otherwise = elem' a [xs]