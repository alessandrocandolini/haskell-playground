module Lib where

import User

someFunc :: IO ()
someFunc = putStrLn "someFunc"


canBuyAlcohol :: Age -> Bool 
canBuyAlcohol age = age >= threshold where 
        threshold = Age 18


