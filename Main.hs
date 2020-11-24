module Main where
import Data.List

main :: IO ()
main = putStrLn "main function!"

sumlist :: [Double] -> Double
sumlist [] = 0
sumlist (x:xs) = x + sumlist xs

alltrue :: [Bool] -> Bool
alltrue [] = True
alltrue (x:xs) = x && alltrue(xs)

onetrue :: [Bool] -> Bool
onetrue [] = False
onetrue (x:xs) = x || onetrue(xs)

cat :: [String] -> String
cat [] = ""
cat (x:xs) = x ++ cat(xs)

inf :: [Double] -> Double
inf [] = 0
inf [x] = x
inf (x:xs) = min x (inf xs)

sup :: [Double] -> Double
sup [] = 0
sup [x] = x
sup (x:xs) = max x (sup xs)

occurs :: String -> [String] -> Either [String] Bool
occurs s [] = Right False
occurs s (x:xs) =
       if s == x then Left xs
       else (occurs s xs)

tabulate :: (Num a, Eq a) => a -> (a -> a) -> [a]
tabulate 0 f = [(f 0)]
tabulate n f = (f n) : (tabulate (n-1) f)

fold1 :: (Num a, Eq a) => [a] -> (a -> a -> a) -> a
fold1 [] f = 0
fold1 (x:xs) f = f x (fold1 xs f)

findname :: String -> [String] -> Bool
findname s [] = False
findname s (x:xs) = if s==x ||
         isSuffixOf s x ||
         isPrefixOf s x
         then True else (findname s xs)

buildlist :: Double -> (Double -> a) -> [a]
buildlist 0 f = []
buildlist num f = [(f num)] ++ (buildlist (num-1) f)

filter' :: (a->Bool) -> [a] -> [a]
filter' p [] = []
filter' p (x:xs) = if(p x) then (x:(filter' p xs)) else (filter' p xs)

sort' :: [a] -> (a -> a -> Bool) -> [a]
sort' [] cmp = []
sort' (x:xs) cmp = order (sort' xs cmp) x cmp

order :: [a] -> a -> (a -> a -> Bool) -> [a]
order [] n  cmp = [n]
order (x:xs) n cmp  = if cmp n x then (x:n:xs)
      else (n:order xs n cmp)

map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f (x:xs) = f x: map' f xs

andmap' :: (a -> Bool) -> [a] -> Bool
andmap' f [] = True
andmap' f (x:xs) = (f x) && (andmap' f xs)

ormap' :: (a -> Bool) -> [a] -> Bool
ormap' f [] = False
ormap' f (x:xs) = (f x) || (ormap' f xs)
