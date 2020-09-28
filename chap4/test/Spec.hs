module Spec where 

import User
import Lib
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck

areEqual = assertEqual ""

unit_canBuyAlcohol= areEqual True ( canBuyAlcoholEurope (Age 20) )
unit_cannotBuyAlcohol= areEqual False ( canBuyAlcoholEurope (Age 5) )
