module User where

import qualified Data.Text as T

newtype UserId = UserId Integer 
newtype UserName = UserName T.Text
data DateOfBirth = DateOfBirth {
    year :: Integer,
    month :: Int , 
    day :: Int 
                                  }  -- add "smart" constrains to instantiate values of this, safely

newtype Age = Age Integer deriving (Show, Eq, Ord)

data UserDetails= UserDetails {
   id :: UserId, 
   name :: UserName, 
   dateOfBirth :: DateOfBirth
                              }
