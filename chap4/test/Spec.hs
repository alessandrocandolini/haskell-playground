module Spec where 

import User
import Lib
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck

areEqual = assertEqual ""

unit_canBuyAlcohol= areEqual True ( canBuyAlcohol (Age 20) )
unit_cannotBuyAlcohol= areEqual False ( canBuyAlcohol (Age 5) )
