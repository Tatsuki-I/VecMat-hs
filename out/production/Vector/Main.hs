import Data.Maybe

type Vec a = Maybe [a]

{-
vecAdd :: Num a => Vec a -> Vec a -> Vec a
vecAdd x y | length x == length y = zipWith (+) x y
           | otherwise = [-1]
           -}

vecEqlLength :: Num a => Vec a -> Vec a -> Bool
vecEqlLength x y | length x == length y = True
                 | otherwise            = False

vecAdd :: Num a => Vec a -> Vec a -> Vec a
vecAdd x y | vecEqlLength x y = Just $ zipWith (+) (fromMaybe [] x) (fromMaybe [] y)
           | otherwise        = Nothing

vecSub :: Num a => Vec a -> Vec a -> Vec a
vecSub x y | vecEqlLength x y = Just $ zipWith (-) (fromMaybe [] x) (fromMaybe [] y)
           | otherwise        = Nothing

vecDot :: Num a => Vec a -> Vec a -> Maybe a
vecDot x y | vecEqlLength x y = Just $ foldr (+) 0 $ zipWith (*) (fromMaybe [] x) (fromMaybe [] y)
           | otherwise        = Nothing

vecScl :: Num a => a -> Vec a -> Vec a
vecScl x y = Just $ map (*x) $ fromMaybe [] y

vecAbs :: Floating a => Vec a -> a
vecAbs x = sqrt $ fromMaybe 0 (vecDot x x)

{-
--type Mat a = [Vec a]
type Mat a = Maybe [Vec a]

matEqlLength :: Num a => Mat a -> Mat a -> Bool
matEqlLength x y | map length x == map length y = True
                 | otherwise                    = False

matAdd :: Num a => Mat a -> Mat a -> Mat a
matAdd x y | matEqlLength x y = Just $ zipWith (vecAdd) (fromMaybe [] x) (fromMaybe [] y)
           | otherwise        = Nothing

matSub :: Num a => Mat a -> Mat a -> Mat a
matSub x y | matEqlLength x y = Just $ zipWith (vecSub) (fromMaybe [] x) (fromMaybe [] y)
           | otherwise        = Nothing

matScl :: Num a => a -> Mat a -> Mat a
matScl x y = Just $ map (vecScl x) $ fromMaybe [] y
-}
main = do
    print $ vecAdd a b
    print $ vecSub a b
    print $ vecDot a b
    print $ vecScl e b
    print $ vecAbs a
    {-
    print $ matAdd c d
    print $ matSub c d
    print $ matScl e d
    -}
    where
        a = Just [1, 2, 3, 4]
        b = Just [4, 3, 2, 1]
        c = Just [Just [2, 1], Just [1, 2]]
        d = Just [Just [2, 3], Just [1, 4]]
        e = 5
