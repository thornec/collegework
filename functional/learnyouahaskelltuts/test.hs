data Point = Float Float

data Shape = Circle Float Point
		   | Rectangle Point Point

surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)


data Person = Person {  firstName :: String
					  , secondName :: String
					  , age :: Int 
					} deriving(Show)