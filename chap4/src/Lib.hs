module Lib where

import User

someFunc :: IO ()
someFunc = putStrLn "someFunc"


canBuyAlcohol :: Age -> Age -> Bool 
canBuyAlcohol threshold age = age >= threshold 

canBuyAlcoholEurope :: Age -> Bool
canBuyAlcoholEurope = canBuyAlcohol (Age 18)
